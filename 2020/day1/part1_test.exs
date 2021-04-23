ExUnit.start(trace: true)

defmodule Part1Test do
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

    assert Part1.product_of_sum(data, 2020) == {1721, 299, 514_579}
  end

  test "challenge" do
    data =
      File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    {x, y, product} = Part1.product_of_sum(data, 2020)
    IO.puts(" Product of #{x} and #{y} is #{product}")
  end
end
