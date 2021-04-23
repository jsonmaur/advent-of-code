ExUnit.start(trace: true)

defmodule Part2Test do
  use ExUnit.Case, async: true

  test "example" do
    data = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc"
    ]

    assert Part2.count_valid(data, 0) == 1
  end

  test "challenge" do
    data =
      File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
      |> String.split("\n", trim: true)

    total = Part2.count_valid(data, 0)
    IO.puts(" There are a total of #{total} valid passwords")
  end
end
