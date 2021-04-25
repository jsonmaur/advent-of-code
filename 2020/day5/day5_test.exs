ExUnit.start(trace: true)

defmodule Aoc2020.Day5Test do
  use ExUnit.Case, async: true

  @example_input ["FBFBBFFRLR", "BFFFBBFRRR", "FFFBBBFRRR", "BBFFBBFRLL"]

  @input File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
         |> String.split("\n", trim: true)

  test "example 1" do
    assert Aoc2020.Day5.to_seat_id(Enum.at(@example_input, 0)) == 357
    assert Aoc2020.Day5.to_seat_id(Enum.at(@example_input, 1)) == 567
    assert Aoc2020.Day5.to_seat_id(Enum.at(@example_input, 2)) == 119
    assert Aoc2020.Day5.to_seat_id(Enum.at(@example_input, 3)) == 820
    assert Aoc2020.Day5.highest_seat_id(@example_input) == 820
  end

  test "part 1" do
    res = Aoc2020.Day5.highest_seat_id(@input)
    IO.puts(" The highest seat ID is #{res}")
  end

  test "part 2" do
    res = Aoc2020.Day5.my_seat_id(@input)
    IO.puts(" Your seat ID is #{res}")
  end
end
