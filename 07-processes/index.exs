# simplest process
pid = spawn(fn -> :timer.sleep(1_000) end)
IO.puts "The process #{inspect pid} is still alive? #{Process.alive?(pid)}"
:timer.sleep(1_000)
IO.puts "The process #{inspect pid} is still alive? #{Process.alive?(pid)}"
pid = spawn(fn ->
  receive do
    message ->
      IO.puts "Received message : #{message}"
  end
end)
IO.puts "The process #{inspect pid} is still alive? #{Process.alive?(pid)}"
send pid, "ahoy!"
:timer.sleep(1)
IO.puts "The process #{inspect pid} is still alive? #{Process.alive?(pid)}"

{:ok, link} = Agent.start_link fn -> [] end

Agent.update(link, fn x -> [:atom|x] end)
Agent.update(link, fn x -> [:another|x] end)
IO.inspect Agent.get(link, fn x -> x end)
