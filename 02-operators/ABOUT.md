# Chapter 2
## Operators

In elixir there are many basic infix operators. But you can override its behaviour and
even make it behave on different data types. It allows to create a whole DSL on your own
if you wanted to.

```elixir
import Kernel, except: [{:@, 1}, {:+, 2}]
defmodule Op do
  def @a, do: "(at) #{a}"
  def a + b, do: "#{a} plus #{b}"
end
import Op

@"home"            # "(at) home"
"hello" + "world"  # "hello plus world"
```

Is not a recommended practice, but is a good example about how extensible is the elixir language.

Due to its erlang nature we have some operators that can do really helpful operations.

### Match (=)

In other languages is know as the assign operator, here is called the match operator because not only assign values but also check that the values can be assigned because they match.

The assignment is done on the left side, the match on the right side, if the match is not successful, raises an exception.

```elixir
a = 2
2 = a
5 = a
** (MatchError) no match of right hand side value: 2
```

It can perform even multiple match

```elixir
{status, variable, _dont_care} = {:ok, :variable, :yadda_yadda}
IO.inspect status    # :ok
IO.inspect variable  # :variable
```

### Pin (^)

Helps to check on the left side of the match operator.

```elixir
status = :ok
{^status, _variable} = {:ok, :yadda}
{^status, _variable} = {:error, :yadda}
** (MatchError) no match of right hand side value: {:error, :yadda}
```

### Pipe (|>)

The pipe operator gives a fluent interface to the calling of the chained functions. sends the left side as first argument to the right side.

```elixir
1..100
  |> Enum.take_every(5)
  |> Enum.take(4) # [1, 6, 11, 16]
```

### Regex match (=~)

If the right side is a string, checks if that string is contained in the left side. if the right side is a regexp, checks if that regexp matches the left side.

```elixir
"abcd" =~ "a"        # true
"abcd" =~ "abcd"     # true
"abcd" =~ "fghi"     # false
"abcd" =~ ~r/\w{4}/  # true
```

### Codepoint (?)

Returns the codepoint of the character inmediately on its right.

```elixir
?a               # 97
?ß               # 223
?\t              # 9
?⚓               # 9875
[?⚅, ?♠] == '⚅♠' # true
```
