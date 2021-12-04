ExUnit.start(trace: true)

defmodule Aoc2021.Part2Test do
  use ExUnit.Case, async: true

  test "example part 2" do
    data = Aoc2021.Helpers.read_input("input_example.txt", :integer)
    assert Aoc2021.Part2.count_increases(data) == 5
  end

  test "challenge part 2" do
    data = Aoc2021.Helpers.read_input("input.txt", :integer)
    total = Aoc2021.Part2.count_increases(data)

    IO.puts(" There are #{total} depth increases in sliding window")
  end
end
