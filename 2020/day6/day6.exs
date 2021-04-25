defmodule Aoc2020.Day6 do
  def sum_of_yes(data, collective \\ false, sum \\ 0)

  def sum_of_yes(data, collective, sum) when is_bitstring(data) do
    sum_of_yes(data |> String.split("\n\n", trim: true), collective, sum)
  end

  def sum_of_yes([head | tail], false, sum) do
    yes =
      head
      |> String.split("", trim: true)
      |> Enum.uniq()
      |> Enum.filter(&(&1 != "\n"))
      |> Enum.count()

    sum_of_yes(tail, false, sum + yes)
  end

  def sum_of_yes([head | tail], true, sum) do
    yes =
      head
      |> String.split("\n", trim: true)
      |> Enum.map(&(&1 |> String.graphemes() |> MapSet.new()))
      |> Enum.sort(&(MapSet.size(&1) >= MapSet.size(&2)))
      |> Enum.reduce(&MapSet.intersection(&1, &2))
      |> Enum.count()

    sum_of_yes(tail, true, sum + yes)
  end

  def sum_of_yes([], _collective, sum) do
    sum
  end
end
