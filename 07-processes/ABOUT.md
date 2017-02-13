# Chapter 7
## Processes

A new process is created via the `spawn` method.

```elixir
pid = spawn(fn -> "hello" end)
IO.inspect pid
Process.alive?(pid) # false
```

The main process created a new process, the child process returned the "hello" string and inmediately exits, leaving the process stopped and therefore not listening on their mailbox.

For a preserved state we will need to use the `Task.start_link` function.

```elixir
defmodule State do
  def start do
    Task.start_link(fn -> loop([]) end)
  end

  def loop(state) do
    receive do
      {:pop, caller} ->
        [v|tail] = state
        send caller, v
        loop(tail)
      {:put, v} ->
        loop([v|state])
    end
  end
end

{:ok, pid} = State.start
send pid, {:put, 6}
send pid, {:put, 18}
send pid, {:pop, self()}
flush() # 18
send pid, {:pop, self()}
flush() # 6
```
