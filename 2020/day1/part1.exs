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
