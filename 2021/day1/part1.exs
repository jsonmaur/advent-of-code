defmodule Aoc2021.Part1 do
  def count_increases(data) do
    data
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.count(fn [x, y] -> y > x end)
  end
end
