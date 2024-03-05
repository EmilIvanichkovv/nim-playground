import json_rpc/rpcserver

# Create a socket server for transport
var srv = newRpcSocketServer("localhost", Port(8585))

# srv.rpc is a shortcut for srv.router.rpc
srv.rpc("hello") do(input: string) -> string:
  result = "Hello " & input

srv.start()
runForever()
