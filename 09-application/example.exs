
Tasker.Client.add(fn -> File.ls(".") end)

{:ok, files} = Tasker.Client.run :first
IO.inspect files

Tasker.Client.add(fn -> IO.puts "first" end)
IO.inspect Tasker.Client.list
IO.inspect Tasker.Client.run :first
