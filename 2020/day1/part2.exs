defmodule Part2 do
  def product_of_sum(data, sum) do
    # recursion would be more efficient, but oh well
    for {x, xi} <- Enum.with_index(data),
        {y, yi} <- Enum.with_index(Enum.slice(data, xi..-1)),
        z <- Enum.slice(data, yi..-1),
        x + y + z == sum,
        do: {x, y, z, x * y * z}
  end
end

data =
  File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
  |> String.split("\n", trim: true)
  |> Enum.map(&String.to_integer/1)

[{x, y, z, product}] = Part2.product_of_sum(data, 2020)
IO.puts("Product of #{x}, #{y}, and #{z} is #{product}")
