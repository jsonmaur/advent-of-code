ExUnit.start()

defmodule Part2Test do
  use ExUnit.Case

  test "examples" do
    data = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc"
    ]

    assert Part2.count_valid(data, 0) == 1
  end
end
