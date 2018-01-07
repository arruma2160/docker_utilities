The purpose of this project is to create a docker environment in which
to run a server and a client instance that communicate in between them
with the need of installing packages in your system, all out of the box
to be run.

Usage:

1) Make sure that the configuration is correct, for this open 'configuration.py'
and make sure that the variable `_ip` is the correct IP address of your system.
    -> [TODO] Next steps in development: make this configuration via a json file.

2) Run the server: `./run.sh server`
This runs the server.py inside the container sitting at port configured with at 
'configuration.py'. This port is mapped with the same port of your system.
    -> [TODO] Next steps in development: extend the configuration of the port to 'run.sh',     at the moment is hardcoded.

3) Run the client: `./run.sh client`
This runs the client that sends its info to the server.


Extra functionality: `./run --help`
