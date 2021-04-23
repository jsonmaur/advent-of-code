ExUnit.start(trace: true)

defmodule Part1Test do
  use ExUnit.Case, async: true

  test "example" do
    data = [
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

    assert Part1.count_trees(data, {3, 1}) == 7
  end

  test "challenge" do
    data =
      File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
      |> String.split("\n", trim: true)

    total = Part1.count_trees(data, {3, 1})
    IO.puts(" There are a total of #{total} trees")
  end
end
