defmodule Aoc2020.Day3 do
  def count_trees(forest, slope, position \\ {0, 0}, trees \\ 0)

  def count_trees([head | tail], slope, {x, y}, trees) do
    x = rem(x + elem(slope, 0), String.length(head))
    y = y + elem(slope, 1)

    next = Enum.drop(tail, max(0, elem(slope, 1) - 1))
    next_line = Enum.at(next, 0, "")

    if String.at(next_line, x) == "#" do
      count_trees(next, slope, {x, y}, trees + 1)
    else
      count_trees(next, slope, {x, y}, trees)
    end
  end

  def count_trees([], _slope, _position, trees) do
    trees
  end

  def count_trees_multi(forest, slopes) do
    slopes
    |> Enum.map(&count_trees(forest, &1))
    |> Enum.reduce(&(&1 * &2))
  end
end
