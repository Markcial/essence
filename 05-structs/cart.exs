Code.require_file "product.exs", __DIR__

defmodule Cart do

  defstruct products: []

  def add(%Cart{products: products} = cart, %Product{} = product) do
    %Cart{cart| products: [product|products]}
  end
end
