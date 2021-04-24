ExUnit.start(trace: true)

defmodule Aoc2020.Day3Test do
  use ExUnit.Case, async: true

  @data [
    "..##.......",
    "#...#...#..",
    ".#....#..#.",
    "..#.#...#.#",
    ".#...##..#.",
    "..#.##.....",
    ".#.#.#....#",
    ".#........#",
    "#.##...#...",
    "#...##....#",
    ".#..#...#.#"
  ]

  @input File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
         |> String.split("\n", trim: true)

  test "example 1" do
    res = Aoc2020.Day3.count_trees(@data, {3, 1})
    assert res == 7
  end

  test "example 2" do
    res = Aoc2020.Day3.count_trees_multi(@data, [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}])
    assert res == 336
  end

  test "challenge 1" do
    res = Aoc2020.Day3.count_trees(@input, {3, 1})
    IO.puts(" There are a total of #{res} trees")
  end

  test "challenge 2" do
    res = Aoc2020.Day3.count_trees_multi(@input, [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}])
    IO.puts(" The product of the total trees is #{res}")
  end
end
