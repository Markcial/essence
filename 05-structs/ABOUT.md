# Chapter 5
## Structs

Structs are map objects created from modules. The module is defined as struct via the `defstruct` method.

```elixir
defmodule Customer do
  defstruct name: nil, cart: []
end

IO.inspect %Customer{}  # %Customer{cart: [], name: nil}
IO.inspect %Customer{name: "Jack Daniels"} # %Customer{cart: [], name: "Jack Daniels"}
IO.inspect %Customer{name: "Mark", cart: ["eggs", "bacon"]}  # %Customer{cart: ["eggs", "bacon"], name: "Mark"}
```

A struct can be updated with the `|` operator.

```elixir
defmodule Customer do
  defstruct name: nil, cart: []
end

customer = %Customer{} # %Customer{cart: [], name: nil}
customer = %Customer{customer|name: "Mark"} # %Customer{cart: [], name: "Mark"}
```

The struct can be used for pattern matching.


```elixir
defmodule Customer do
  defstruct name: nil, cart: []
end

customer = %Customer{cart: ["eggs", "bacon"]} # %Customer{cart: [], name: nil}
items = fn %Customer{cart: items} -> "Got #{Enum.join items, ","}" end
items.(customer)
```
