# Chapter 3
## Functions

### Anonymous Functions

Anonymous functions are declared with the `fn` keyword.

```elixir
foo = fn -> "hello!" end
IO.inspect foo.() # "hello!"
```

They can contain multiple bodies.

```elixir
foo = fn
    x when is_binary(x) -> "binary #{x}"
    x when is_list(x) -> "list #{inspect x}"
    0 -> "I am zero :("
    {:ok, what} -> "say #{what}!"
    x -> "Yeah whatever #{inspect x}" # default fallback
end

foo.("bar")         # "binary bar"
foo.(["bar"])       # "list [\"bar\"]"
foo.(0)             # "I am zero :("
foo.({:ok, :mckey}) # "say mckey!"
foo.(?@)            # "Yeah whatever 64"
```

### Module functions

Functions can be defined inside modules. The `def` keyword is for a public function that can be called outside the module, the `defp` keyword is for a private function callable only from inside the module. The function is enclosed between a `do block`.

```elixir
defmodule Example do
  def public_function do
    "public value" <> " " <> private_function
  end

  defp private_function, do: "private value"
end

Example.public_function # "public value private value"
```
