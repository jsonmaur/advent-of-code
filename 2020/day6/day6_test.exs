ExUnit.start(trace: true)

defmodule Aoc2020.Day6Test do
  use ExUnit.Case, async: true

  @example_input """
  abc

  a
  b
  c

  ab
  ac

  a
  a
  a
  a

  b
  """

  @input File.read!("#{Path.dirname(__ENV__.file)}/input.txt")

  test "example 1" do
    assert Aoc2020.Day6.sum_of_yes(@example_input) == 11
  end

  test "example 2" do
    assert Aoc2020.Day6.sum_of_yes(@example_input, true) == 6
  end

  test "part 1" do
    res = Aoc2020.Day6.sum_of_yes(@input)
    IO.puts(" The sum of all questions answered yes is #{res}")
  end

  test "part 2" do
    res = Aoc2020.Day6.sum_of_yes(@input, true)
    IO.puts(" The sum of all questions collectively answered is #{res}")
  end
end
