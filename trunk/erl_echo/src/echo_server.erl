
-module(echo_server).

-export([start/0]).
-export([start_echo_listener/0, start_echo_connection_sup/0]).
-export([echo_tcp_listener_started/2, echo_tcp_listener_stopped/2]).
-export([start_client/1]).

start() ->
  start_echo_listener(),
  start_echo_connection_sup().

start_echo_listener() ->
  TcpOptions = [binary,
    {packet,raw},
    {reuseaddr,true}, 
    {backlog,128},
    {nodelay,true},                                         
    {exit_on_close,false}],

  [{IPAddress, Port, _, Label}] = tcp_server_util:check_tcp_listener_address(
    tcp, {"127.0.0.1", 2000, inet}),
  {ok,_} = supervisor:start_child(
    tcp_server_sup,
	[IPAddress, Port, TcpOptions,
	  {echo_server, echo_tcp_listener_started, []},
	  {echo_server, echo_tcp_listener_stopped, []},
	  {echo_server, start_client, []},
	  Label]).

start_echo_connection_sup() ->
  tcp_connection_sup:start_link({echo_connection, start_link, []}),
  ok.

echo_tcp_listener_started(IPAddress, Port) ->
  io:format("[~p:~p] listerner started~n", [IPAddress, Port]).

echo_tcp_listener_stopped(IPAddress, Port) ->
  io:format("[~p:~p] listerner stopped~n", [IPAddress, Port]).

start_client(Sock, SockTransform) ->
  {ok, Child} = supervisor:start_child(tcp_connection_sup, []),
  ok = gen_tcp:controlling_process(Sock, Child),
  Child ! {go, Sock, SockTransform},
  Child.

start_client(Sock) ->
  start_client(Sock, fun (S) -> {ok, S} end).
