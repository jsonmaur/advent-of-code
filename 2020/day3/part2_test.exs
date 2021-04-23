ExUnit.start(trace: true)

defmodule Part2Test do
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

    slopes = [
      {1, 1},
      {3, 1},
      {5, 1},
      {7, 1},
      {1, 2}
    ]

    assert Part2.count_trees_multi(data, slopes) == 336
  end

  test "challenge" do
    data =
      File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
      |> String.split("\n", trim: true)

    total = Part2.count_trees_multi(data, [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}])
    IO.puts(" The product of the total trees is #{total}")
  end
end
