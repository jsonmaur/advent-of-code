defmodule Aoc2020.Day7 do
  def count_bags(bags, color, inner \\ false)

  def count_bags(bags, color, inner) when is_bitstring(bags) do
    bags =
      bags
      |> String.split("\n", trim: true)
      |> Enum.reduce(%{}, fn line, acc ->
        [parent, children] = String.split(line, " bags contain ", trim: true)

        Map.put(
          acc,
          parent,
          Regex.scan(~r/([0-9]+) (.+?) bags?/, children)
          |> Enum.map(fn [_, count, child] -> {String.to_integer(count), child} end)
          |> Enum.concat(Map.get(acc, parent, []))
        )
      end)

    count_bags(bags, color, inner)
  end

  def count_bags(bags, color, false) do
    bags
    |> Enum.filter(&can_contain_color?(bags, elem(&1, 0), color))
    |> Enum.count()
  end

  def count_bags(bags, color, true) do
    bags[color]
    |> Enum.map(fn {count, child} -> count + count * count_bags(bags, child, true) end)
    |> Enum.sum()
  end

  def can_contain_color?(bags, bag, color) do
    Enum.any?(bags[bag], &(elem(&1, 1) == color)) or
      Enum.any?(bags[bag], &can_contain_color?(bags, elem(&1, 1), color))
  end
end
