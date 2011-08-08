-module(pb_server).
-compile(export_all).

-include_lib("echo_pb.hrl").

start_server() ->
    {ok, Listen} = gen_tcp:listen(2345, [binary, {packet, 4},  %% (6)
					 {reuseaddr, true},
					 {active, true}]),
    {ok, Socket} = gen_tcp:accept(Listen),  %% (7)
    gen_tcp:close(Listen),  %% (8)
    loop(Socket).

loop(Socket) ->
    receive
	{tcp, Socket, Bin} ->
	    io:format("Server (unpacked)  ~p~n",[Bin]),
	    [MsgCode|MsgData] = binary_to_list(Bin),
	    io:format("code  ~p, data: ~p~n",[MsgCode, MsgData]),
	    Msg = echo_pb_util:decode(MsgCode, list_to_binary(MsgData)),
	    #echo{content=Content, value=Value} = Msg,
	    io:format("content:~p, value:~p~n",[Content, Value]),
	    loop(Socket);
	{tcp_closed, Socket} ->
	    io:format("Server socket closed~n")
    end.
