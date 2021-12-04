defmodule Aoc2021.Part2 do
  def count_increases(data) do
    data
    |> Stream.chunk_every(3, 1, :discard)
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.count(fn [[x, _, _], [_, _, y]] -> y > x end)
  end
end
