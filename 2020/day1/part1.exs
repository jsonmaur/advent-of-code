defmodule Part1 do
  def product_of_sum([head | tail], sum) do
    target = sum - head

    if not Enum.member?(tail, target) do
      product_of_sum(tail, sum)
    else
      {head, target, head * target}
    end
  end

  def product_of_sum([], sum) do
    raise "No numbers create a sum of #{sum}"
  end
end

data =
  File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
  |> String.split("\n", trim: true)
  |> Enum.map(&String.to_integer/1)

{x, y, product} = Part1.product_of_sum(data, 2020)
IO.puts("Product of #{x} and #{y} is #{product}")
