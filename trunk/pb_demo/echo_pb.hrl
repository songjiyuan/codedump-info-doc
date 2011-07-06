-record(echo, {
    content = erlang:error({required, content}),
    value = erlang:error({required, value})
}).

