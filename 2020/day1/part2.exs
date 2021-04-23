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
