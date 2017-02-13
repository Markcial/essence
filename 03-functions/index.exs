
# closures
cl = fn x ->
  x*2
end
IO.inspect cl.(4)
# short notation
sn = &(&1 - (&2 * &3))
IO.inspect sn.(100, 5, 6)
# dynamic module creation
body = quote do
  def foo, do: 5
end
Module.create SomeModule, body, Macro.Env.location(__ENV__)
IO.inspect SomeModule.foo
# Scripted module
defmodule SomeModule2 do
  def foo do
    15
  end

  def bar(a \\ "default") when is_binary(a) do
    "bar" <> a
  end

  def printer(what, printer \\ &IO.inspect/1) do
    printer.(what)
  end

  def match(0) do
    IO.puts "I only run when the argument is 0"
  end

  def match("partial:"<>matching) do
    IO.puts "Partially matching #{matching}"
  end

  def match(arg) when is_list(arg) do
    IO.puts "Guard with list argument #{inspect arg}"
  end
end
IO.inspect SomeModule2.foo
IO.inspect SomeModule2.bar
IO.inspect SomeModule2.bar "bar"
SomeModule2.printer :"an atom"
SomeModule2.match 0
SomeModule2.match "partial:arguments"
SomeModule2.match [:a, :b, :c]


System.halt
