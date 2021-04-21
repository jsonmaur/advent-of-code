ExUnit.start()

defmodule Part1Test do
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

    assert Part1.product_of_sum(data, 2020) == {1721, 299, 514_579}
  end
end
