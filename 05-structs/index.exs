Code.require_file "user.exs", __DIR__

defmodule Example do
  def run do
    user = %User{name: "Dummy customer", email: "meh@gmail.com"}
    IO.inspect user.name
    IO.inspect user.email
    IO.inspect user.cart

    product1 = %Product{name: "Cafe", price: 12.43}
    product2 = %Product{name: "Leche", price: 1.45}
    cart = Cart.add(user.cart, product1)
      |> Cart.add(product2)
    user = %User{user|cart: cart}

    IO.inspect user.cart
  end
end

Example.run
System.halt
