Code.require_file "cart.exs", __DIR__

defmodule User do
  @enforce_keys [:name, :email]
  defstruct [:name, :email, cart: %Cart{}]

end
