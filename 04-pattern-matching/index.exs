defmodule Example do
  Code.require_file "user.exs", __DIR__

  def match do
    IO.puts "No arguments"
  end

  def match(0) do
    IO.puts "defined argument (0)"
  end

  def match("foo") do
    IO.puts "defined argument ('foo')"
  end

  def match("foo:"<>partial) do
    IO.puts "partial string matching with argument 'foo:#{partial}'"
  end

  def match({:term, x}) do
    IO.puts "tuple argument matching with #{x}"
  end

  def match([h|t]) do
    IO.puts "List with head #{inspect h} and tail #{inspect t}"
  end

  def match(%User{name: name}) do
    IO.puts "Getting parameters inside structs : #{name}"
  end

  def user(name) do
    %User{name: name}
  end
end

Example.match
Example.match 0
Example.match "foo"
Example.match "foo:bar"
Example.match {:term, 12}
Example.match [3,4,5,6]
user = Example.user "Some kind of struct"
Example.match user
