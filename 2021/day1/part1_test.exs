ExUnit.start(trace: true)

defmodule Aoc2021.Part1Test do
  use ExUnit.Case, async: true

  test "example part 1" do
    data = Aoc2021.Helpers.read_input("input_example.txt", :integer)
    assert Aoc2021.Part1.count_increases(data) == 7
  end

  test "challenge part 1" do
    data = Aoc2021.Helpers.read_input("input.txt", :integer)
    total = Aoc2021.Part1.count_increases(data)

    IO.puts(" There are #{total} depth increases")
  end
end
