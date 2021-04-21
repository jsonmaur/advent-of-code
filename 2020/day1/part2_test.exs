ExUnit.start()

defmodule Part2Test do
  use ExUnit.Case

  test "examples" do
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
end
