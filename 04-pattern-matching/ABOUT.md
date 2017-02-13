# Chapter 4
## Pattern matching

### Basic matching

Matching can be done with the [match (=) operator](/02-operators/ABOUT.md#match-).

```elixir
{:ok, variable} = {:ok, 'value'}
IO.inspect variable # 'value'
```

The matching can be at any depth of the inspected object.

```elixir
{:ok, [key: %{map: [x|_]}]} = {:ok, [key: %{map: [5,7,9], foo: 'bar'}]}
IO.inspect x # 5
```

Can be done with the `case` function.

```elixir
case {:ok, :spam} do
  {:ok, x} -> "Received var #{x}"
  {:error, x} -> "Error with var #{x}"
  _ -> "Got nothing"
end
# "Received var :spam"
```

Via an anonymous functions with multiple bodies.

```elixir
foo = fn
  %{key: [x|_]} -> "First element inside key is #{x}"
  %{spam: eggs} -> "Eggs with #{eggs}"
  _ -> "Got nothing"
end
foo.(%{key: [9,6,3]})  # "First element inside key is 9"
foo.(%{spam: 'bacon'}) "Eggs with bacon"
foo.(:meh) # got nothing
```

Via a module with multiple functions.

```elixir
defmodule Example do
  def foo(%{spam: [spam: spam]}), do: "Spam spam spam #{spam}"
  def foo(%{spam: eggs}), do: "I have some #{eggs}"
  def foo(0), do: "I am zero"
  def foo(_), do: "Yeah whatever..."
end

Example.foo(0)                       # "I am zero"
Example.foo(%{spam: "bacon"})        # "I have some bacon" 
Example.foo(%{spam: [spam: "eggs"]}) # "Spam spam spam eggs"
Example.foo(:meh)                    # "Yeah whatever..."
```
