ExUnit.start(trace: true)

defmodule Aoc2020.Day7Test do
  use ExUnit.Case, async: true

  @example_input1 """
  light red bags contain 1 bright white bag, 2 muted yellow bags.
  dark orange bags contain 3 bright white bags, 4 muted yellow bags.
  bright white bags contain 1 shiny gold bag.
  muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
  shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
  dark olive bags contain 3 faded blue bags, 4 dotted black bags.
  vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
  faded blue bags contain no other bags.
  dotted black bags contain no other bags.
  """

  @example_input2 """
  shiny gold bags contain 2 dark red bags.
  dark red bags contain 2 dark orange bags.
  dark orange bags contain 2 dark yellow bags.
  dark yellow bags contain 2 dark green bags.
  dark green bags contain 2 dark blue bags.
  dark blue bags contain 2 dark violet bags.
  dark violet bags contain no other bags.
  """

  @input File.read!("#{Path.dirname(__ENV__.file)}/input.txt")

  test "example 1" do
    assert Aoc2020.Day7.count_bags(@example_input1, "shiny gold") == 4
  end

  test "example 2" do
    assert Aoc2020.Day7.count_bags(@example_input1, "shiny gold", true) == 32
    assert Aoc2020.Day7.count_bags(@example_input2, "shiny gold", true) == 126
  end

  test "part 1" do
    res = Aoc2020.Day7.count_bags(@input, "shiny gold")
    IO.puts(" There are #{res} bags that will eventually contain that color")
  end

  test "part 2" do
    res = Aoc2020.Day7.count_bags(@input, "shiny gold", true)
    IO.puts(" There are #{res} bags required inside your bag")
  end
end
