import argparse
import requests
import json
import urllib3
import urllib

program_version = " 1.0, 06.02.24"

#
# programt that insert into autonomous over ORDS
#
# Inserts kmh only or kmh and temp
#
# If neither temp nor kmh is set, a RESAT API GET is performed
#
#
# Commandline arguments or configfile parameters and defaults
# Parameter name, default value, boolean true/false,"Help text"
#

config_parameters = [
    ["url", None, False, "URL to autonmous database"],
    ["dbuser", None, False, "Database Username"],
    ["dbpwd", None, False, "Database Password"],
    ["temp", None, False, "Outdoor temp"],
    ["kmh", None, False, "running speed of car"],
]

# For Autonomous, dbuser/dbs password is not used, no authentication required
mandatory_parameters = ["url"]


#########################################################################
# verify_args
# iterates ofer all mandatory args and lookup in the args Namespace
########################################################################
def print_usage():
    #
    print(
        "Usage: python simulate [mandatory argumnets] --temp  <value> --kmh <--value>"
    )
    #
    # Print all madatroy arguments
    #
    for param in config_parameters:
        print("--" + param[0] + " " + param[3])
    print("Use eiter --temp <value> --kmh <value> or --kmh <value> only")


#########################################################################
# verify_args
# iterates ofer all mandatory args and lookup in the args Namespace
#########################################################################
def verify_args(args):
    #
    # Args returns a namespace, convert to doct
    #
    dargs = vars(args)
    #
    # Check args
    #
    for arg in mandatory_parameters:
        if arg not in dargs or dargs[arg] is None:
            print("Mandaroty argumen: " + arg + " is not set")
            print_usage()
            return False
    return True


#########################################################################
# parse_cmd_line
# Parses the commandline with argsparser and returns args Namespace
#########################################################################
def parse_cmd_line():
    """parse_cmd_line"""
    global config_parameters
    args_parser = argparse.ArgumentParser(
        description="Autonomous temp/kmh runtime data collection simulation "
    )
    #
    # Loop throug and set all commandline parameters
    #
    for arg in config_parameters:
        args_parser.add_argument("--" + arg[0], default=arg[1], type=str, help=arg[3])
    # Parse and return parsed Namespace
    args = args_parser.parse_args()

    return args


########################################################################
# basic_auth
# helper funtion for bas64 encoding client secret/client id
########################################################################
def basic_auth(username, password):
    token = base64.b64encode(f"{username}:{password}".encode("utf-8")).decode("ascii")
    return f"Basic {token}"


########################################################################
# pretty_print_POST
# Helper funtion for pretty printing raw format of request
########################################################################
def pretty_print_POST(req):
    """
    At this point it is completely built and ready
    to be fired; it is "prepared".

    However pay attention at the formatting used in
    this function because it is programmed to be pretty
    printed and may differ from the actual request.
    """
    print(
        "{}\n{}\r\n{}\r\n\r\n{}".format(
            "-----------START-----------",
            req.method + " " + req.url,
            "\r\n".join("{}: {}".format(k, v) for k, v in req.headers.items()),
            req.body,
        )
    )


########################################################################
# ords_api
# Function to call GET or POST ORDS API
#
# verify_args ensures that at least kmh, temp or speed is set
#
# If neither nor temp is set, speed is set, and a GET will be processed
# if any of temp or kmh is set a POST will be performed
########################################################################
def ords_api(args, dbg=0):
    #
    # apiurl
    #
    apiurl = args.url
    if dbg > 0:
        print(apiurl)
    #
    # Generate base 64 access token based on clientd/client secret
    #
    if args.dbuser is not None:
        headers = {
            "Authorization": +basic_auth(args.dbuser, args.dbpwd),
            "Content-Type": "application/json",
        }
    else:
        headers = {"Content-Type": "application/json"}
    #
    #  Generate payload.
    #
    payload = {}
    if not args.kmh is None:
        payload["kmh"] = args.kmh
    if not args.temp is None:
        payload["temp"] = args.temp
    #
    # Process GET or POST
    # if there are no payload, assume GET  (Query parameters in URL)
    # 
    api_status_code = -1
    try:
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
        if len(payload) > 0:
            response = requests.post(
                url=apiurl, headers=headers, data=json.dumps(payload), verify=False
            )
        else:
            response = requests.get(url=apiurl, headers=headers, verify=False)
        api_status_code = response.status_code
    except Exception as httpError:
        print("Error processing ORDS api: " + apiurl)
        print(httpError)
        return False
    if not (api_status_code >= 200 and api_status_code <= 201):
        print(
            "Executing API "
            + apiurl
            + " "
            + ('GET' if len(payload) == 0 else 'POST')
            + " status code: "
            + str(api_status_code)
        )
        if dbg > 0:
            print(response.content)
            if len(payload) > 0:
                r = requests.Request("POST", apiurl, headers=headers, data=payload)
            else:
                r = requests.Request("GET", apiurl, headers=headers, data=None)
            prepared_request = r.prepare()
            pretty_print_POST(prepared_request)
        return False

    return response


########################################################################
# main function,
# called if run from cmd line
########################################################################
def main():
    #
    # Get and verify args
    #
    args = parse_cmd_line()
    if not verify_args(args):
        exit(1)
    #
    # fetch kmh and/or temp
    #
    kmh = args.kmh
    if not args.kmh is None:
        try:
            kmh = int(args.kmh)
        except Exception as e:
            print("kmh should be an integer value")
            print(e)
            exit(1)
    temp = args.temp
    if not args.temp is None:
        try:
            temp = float(args.temp)
        except Exception as e:
            print("temp should be an integer value")
            print(e)
            exit(1)
    #
    #  Execute REST API
    # 
    response = ords_api(args, 1)
    if response == False:
        print("Update of autonomous failes, review error stack")
        exit(1)
    else:
        print(response)
        #
        # Post responses do not have any content
        #
        if len(response.content) > 0:
            #
            # Convert content to JSON and pretty print it
            #
            try:
                json_formatted_str = json.dumps(
                    response.content.decode("utf-8"), indent=2
                )
                print(json_formatted_str)
            except Exception as e:
                print(response.content)
        print()
        print("Autonomous database ORDS REST operation is successfull")
    # terminate
    #
    exit(0)


if __name__ == "__main__":
    main()
