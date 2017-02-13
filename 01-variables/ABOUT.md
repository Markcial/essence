# Chapter 1
## Variables

### Atoms
The basic type for elixir is the [atom](http://elixir-lang.org/crash-course.html#atoms).

The atom type is used as a keyword or aliases for variables or modules

Atoms are defined by a starting semicolon if they have meaning per se, or with a starting lowercase if they are a variable alias and starting with a uppercase letter if is a module alias.

```elixir
i :atom
i :snake_case_atom
i :'i am an atom too'
i :"spaced atom"

im_a_var = 1
i quote do: quote im_a_var

i UnknownModule
```

You can check the type with the `is_atom` function.

```elixir
is_atom(:ok)               # true
is_atom(:'whoot?')         # true
is_atom(:"am i an atom?")  # true
is_atom(UnknownModule)     # true
```

### Tuples

Tuples are higly optimized collections of elements, because of this high optimization they usually have fixed width and cannot behave as linked lists or enumerated.

```elixir
is_tuple {:tuple, 12} # true
```

### Lists

The tuple is a collection of elements, non binary strings are a tuple of characters.

```elixir
is_list 'i am a char list'       # true
is_list "i am a binary string"   # false
is_list [0, 1, 3, 4, 5]          # true
```

Values can be fastly prepended to any list with some basic operators like the `|` or append operator.

```elixir
l = [1, 2]
IO.inspect [5|l] # [5,1,2]
```

There are operators for item deletion or concatenation like `++` or `--`

```elixir
IO.inspect [0,1,2,3] ++ [4,5,6,7]   # [0,1,2,3,4,5,6,7]
IO.inspect 'hello ' ++ 'world'      # 'hello world'
IO.inspect [0,1,2,3,4,5] -- [2,4,5] # [0,1,3]
```

You can take the head or tail from lists with matching or by using the `hd` or `tl` functions.

```elixir
[h|t] = [4,5,6,7]
IO.inspect h # 4
IO.inspect t # [5,6,7]
IO.inspect hd([3,4]) # 3
IO.inspect tl([3,4]) # [4]
```

### Keyword lists

A keyword list is a keyed based dictionary, the keys are treated as atoms but the syntax does not require the semicolon syntax.

```elixir
[key: :value, "spaced key": 'a value']
```

### Maps

Maps are like keyword lists but the keys must be unique for a faster key search.

Maps can be updated with the `|` operator.

```elixir
my_map = %{key: "value", foo: :bar}
%{my_map|key: "anoher value"} # %{key: "another value", foo: :bar}
```

### Streams

Streams are iterable objects that can be looped without worrying about the length of the items on that iterable element, is possible that the stream have no end at all, like a system input device for example.

```elixir
Stream.cycle('01234') |> Stream.take(12) |> Enum.to_list # '012340123401'
```
