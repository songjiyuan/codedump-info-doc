-module(pb_client).
-compile(export_all).

-include_lib("echo_pb.hrl").

nano_client_eval() ->
    {ok, Socket} = 
	gen_tcp:connect("localhost", 2345,
			[binary, {packet, 4}]),
    Msg = #echo{content="hello world", value=1},
    Pkt = echo_pb_util:encode(Msg),
    ok = gen_tcp:send(Socket, Pkt),
    receive
	{tcp,Socket,Bin} ->
	    io:format("Client received binary = ~p~n",[Bin]),
	    Val = binary_to_term(Bin),
	    io:format("Client result = ~p~n",[Val]),
	    gen_tcp:close(Socket)
    end.
