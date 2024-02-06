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

mandatory_parameters = ["url", "dbuser", "dbpwd", "kmh"]

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
# api_get
# Function to call GET methods of SCIM REST API
########################################################################
def api_user(args,access_token,userid,op,payload=None,dbg=0):
    #
    # apiurl
    #
    api=f'/admin/v1/Users/{userid}'
    apiurl=args.url+api
    if dbg>0:
        print(apiurl)
    #
    # Generate base 64 access token based on clientd/client secret
    #
    headers = { 'Authorization' : f'Bearer {access_token}', "Content-Type":"application/json" }
    #
    # Get the group attributes
    #
    api_status_code=-1
    try:    
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
        if op == 'PATCH':
            response = requests.get(url=apiurl, headers=headers, data=payload,verify=False)
        else if op ==' DELETE':
            response = requests.get(url=apiurl, headers=headers, verify=False)
        else:
            print('Only patch/delete is applicable')
            exit(1)
        api_status_code=response.status_code
    except Exception as httpError:
        print("Error processing api: "+api)
        print(httpError)
        return(False)
    if not (api_status_code >= 200 and  api_status_code <=201):
        print('Fetching api '+api+' '+op+' status code: '+str(api_status_code))
        if dbg>0:
            print(response.content)
            r = requests.Request(op,apiurl,headers=headers,data=payload)
            prepared_request = r.prepare()
            pretty_print_POST(prepared_request)
        return(False)
    jresponse=json.loads(response.content)
    if (dbg % 2) == 0 and dbg >0 :
        print("#####################################################################")
        print(response.content)
        print("#####################################################################")
    return(jresponse)

########################################################################
# main function,
# called if run from cmd line
########################################################################
def main():
    #
    # Get and verify args
    #
    args = parse_cmd_line()
    print(args)
    if not verify_args(args):
        exit(1)
    #
    # fetch kmh and/or temp
    #
    try:
        kmh=int(args.kmh)
    except Exception as e:
        print("kmh should be an ingeter value")
        print(e)
        exit(1)
    temp=args.temp
    if args.temp not None:
        try:
            temp=float(ars.temp)
        except Exception as e:
            print("kmh should be an ingeter value")
            print(e)
            exit(1)
    #
    #  Post update to ORDS
    #
    if do_post(args,kmh,temp):
        print("Autonomous pdated successfully")
    else
        print("Update of autonomous failes, review error stack")
        exit(1)
    #
    # terminate
    #
    exit(0)
     


if __name__ == "__main__":
    main()
