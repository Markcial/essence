defmodule Tasker.Client do

  def add(func) do
    GenServer.cast(Tasker.Server, {:add, func})
  end

  def list do
    GenServer.call(Tasker.Server, :list)
  end

  def run(:first) do
    func = GenServer.call(Tasker.Server, :first)
    func.()
  end

  def run(:last) do
    func = GenServer.call(Tasker.Server, :last)
    func.()
  end

  def run(:all) do
    funcs = GenServer.call(Tasker.Server, :all)
    funcs
      |> Enum.each(fn f -> f.() end)
  end
end
