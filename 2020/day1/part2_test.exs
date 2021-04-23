ExUnit.start(trace: true)

defmodule Part2Test do
  use ExUnit.Case, async: true

  test "example" do
    data = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]

    assert Part2.product_of_sum(data, 2020) == [{979, 366, 675, 241_861_950}]
  end

  test "challenge" do
    data =
      File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    [{x, y, z, product}] = Part2.product_of_sum(data, 2020)
    IO.puts(" Product of #{x}, #{y}, and #{z} is #{product}")
  end
end
