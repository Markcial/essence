defmodule SampleTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Sample

  setup_all do
    Tasker.Client.add(fn -> IO.puts "last" end)
    Tasker.Client.add(fn -> IO.puts "first" end)
  end

  test "count the tasks" do
    assert length(Tasker.Client.list) == 2
  end

  test "execute first task" do
    assert capture_io(fn -> Tasker.Client.run :first end) == "first\n"
  end

  test "execute last task" do
    assert capture_io(fn -> Tasker.Client.run :last end) == "last\n"
  end

  test "execute all tasks" do
    assert capture_io(fn -> Tasker.Client.run :all end) == "first\nlast\n"
  end
end
