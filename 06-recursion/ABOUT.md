# Chapter 6
## Recursion

Recursion can be achieved thanks to the pattern matching. The edge cases are
defined first and then the most common cases.

```elixir
defmodule Recursion do
  def fib(x) when x in [0,1], do: x
  def fib(x), do: fib(x-1) + fib(x-2)
end

Recursion.fib(12) # 114
