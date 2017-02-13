defmodule Example do

  defp loop do
    receive do
      {:foo, text} ->
        IO.puts text
        loop()
      what ->
        IO.puts "Unknown message #{inspect what}"
        loop()
      {:stop} ->
        IO.puts "stopping"
        System.halt
    end
  end

  def listen do
    spawn(&loop/0)
  end

  def message(pid, msg) do
    send pid, {:foo, msg}
  end
end

pid = Example.listen
Example.message(pid, "bacon")
Example.message(pid, "eggs")
Example.message(pid, "spam")
send pid, [:meh]
send pid, {:stop}
