a = 10
b = 5.3
c = 'chars'
d = "binary string"
e = :atom
f = [map: e]
g = {"tuple", "of", "items"}

[a, b, c, d, e, f, g]
  |> Enum.each(&IO.inspect/1)

System.halt
