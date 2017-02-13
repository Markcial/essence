# Chapter 7
## Messaging

### Spawn

Inner design of erlang/elixir allows the messaging via low latency processes.

A new process is created via the `spawn` method.

```elixir
pid = spawn(fn -> "hello" end)
IO.inspect pid
Process.alive?(pid) # false
```

The main process created a new process, the child process returned the "hello" string and inmediately exits, leaving the process stopped and therefore not listening on their mailbox.

The processes with `send` and `receive` can interact with its mailboxes for messaging.

```elixir
pid = spawn(fn ->
  receive do
    message ->
      IO.puts "Got #{message}"
  end
end)
send pid, "Hallo"   # Got Hallo
```
