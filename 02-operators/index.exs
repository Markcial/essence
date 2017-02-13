defmodule Example do
  # Custom operators
  def a | b do
    IO.puts "Merging #{inspect a} with #{inspect b}"
    Map.merge a, b
  end

  def @a do
    IO.puts "called method @ with arg #{a}"
  end

  def ~~~ x do
    IO.puts "called ~~~ operator with arg #{x}"
  end

  def a ^^^ b do
    IO.puts "Merging item #{inspect a} with item #{inspect b}"
    a ++ b
  end

  import Kernel, except: [@: 1]
  def run do
    IO.inspect %{foo: "bar"} | %{eggs: "spam"}
    @"hello"
    IO.inspect [:a, :b, :c] ^^^ [:d, :e, :f]
    ~~~:"some kind of atom"

    IO.inspect 12 + 5.43
    IO.inspect "concat" <> "enation"
    IO.inspect 'char' ++ 'lists'

    # range operator
    1..10
    |> Enum.filter( &(rem(&1, 2)==0) )
    # pipe operator + arity operator
    |> Enum.each(&IO.inspect/1)
  end
end

Example.run
System.halt
