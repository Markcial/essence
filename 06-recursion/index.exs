defmodule Example do

  def palindrome?(<<_::bytes-size(1)>>) do
    true
  end

  def palindrome?(<<letter::bytes-size(1)>> <> <<letter::bytes-size(1)>>) do
    true
  end

  def palindrome?(<<letter::bytes-size(1)>> <> rest) do
    rest = String.strip(rest)

    if String.ends_with? rest, letter do
      palindrome? String.slice(rest, 0..-2)
    else
      false
    end
  end
end

phrases = ["ada", "foo", "dabale arroz a la zorra el abad"]
Enum.each(phrases, fn phrase ->
  is = Example.palindrome? phrase
  IO.puts "The phrase '#{phrase}' is a palindrome? #{inspect is}"
end)
