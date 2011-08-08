-module(echo_pb_util).
-compile(export_all).

-include_lib("echo_pb.hrl").

%% Create an iolist of msg code and protocol buffer message
encode(Msg) when is_atom(Msg) ->
  [msg_code(Msg)];
encode(Msg) when is_tuple(Msg) ->
  MsgType = element(1, Msg),
  [msg_code(MsgType) | echo_pb:iolist(MsgType, Msg)].

%% Decode a protocol buffer message given its type - if no bytes
%% return the atom for the message code
decode(MsgCode, <<>>) ->
  msg_type(MsgCode);
decode(MsgCode, MsgData) ->
  echo_pb:decode(msg_type(MsgCode), MsgData).

msg_type(0) -> echo;
msg_type(_) -> undefined.

msg_code(echo) -> 0.
