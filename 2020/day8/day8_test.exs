ExUnit.start(trace: true)

defmodule Aoc2020.Day8Test do
  use ExUnit.Case, async: true

  @example_input """
  nop +0
  acc +1
  jmp +4
  acc +3
  jmp -3
  acc -99
  acc +1
  jmp -4
  acc +6
  """

  @input File.read!("#{Path.dirname(__ENV__.file)}/input.txt")

  test "example 1" do
    assert Aoc2020.Day8.execute(@example_input) == {:nok, 5}
  end

  test "example 2" do
    assert Aoc2020.Day8.fix(@example_input) == {:ok, 8, 8}
  end

  test "part 1" do
    {_, res} = Aoc2020.Day8.execute(@input)
    IO.puts(" Accumulator is at #{res} during first recurrence")
  end

  test "part 2" do
    {:ok, res, line} = Aoc2020.Day8.fix(@input)
    IO.puts(" Accumulator is at #{res} with line #{line} fixed")
  end
end
