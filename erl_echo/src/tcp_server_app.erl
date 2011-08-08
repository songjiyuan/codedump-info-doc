-module(tcp_server_app).
-behaviour(application).

-export([start/2, stop/1]).

start(normal, _Args) ->
  tcp_server_sup:start_link().

stop(_Args) ->
  ok.
