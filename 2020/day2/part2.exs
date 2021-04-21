defmodule Part2 do
  @pattern ~r{^([0-9]+)-([0-9]+) (.+): (.+)$}

  def count_valid([head | tail], total) do
    [_, p1, p2, char, password] = Regex.run(@pattern, head)

    chars = String.graphemes(password)
    char1 = Enum.at(chars, String.to_integer(p1) - 1)
    char2 = Enum.at(chars, String.to_integer(p2) - 1)

    if char1 != char2 and (char1 == char or char2 == char) do
      count_valid(tail, total + 1)
    else
      count_valid(tail, total)
    end
  end

  def count_valid([], total) do
    total
  end
end

data =
  File.read!("#{Path.dirname(__ENV__.file)}/input.txt")
  |> String.split("\n", trim: true)

total = Part2.count_valid(data, 0)
IO.puts("There are a total of #{total} valid passwords")
