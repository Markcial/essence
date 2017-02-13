defmodule Tasker.Server do
  use GenServer

  @doc """
  Starts the GenServer link.
  """
  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def handle_cast({:add, item}, state) do
    {:noreply, [item | state]}
  end

  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:first, _from, state) do
    {:reply, List.first(state), state}
  end

  def handle_call(:last, _from, state) do
    {:reply, List.last(state), state}
  end

  def handle_call(:all, _from, state) do
    {:reply, state, state}
  end
end
