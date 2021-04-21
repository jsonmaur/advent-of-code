defmodule Part1 do
  @pattern ~r{^([0-9]+)-([0-9]+) (.+): (.+)$}

  def count_valid([head | tail], total) do
    [_, min, max, char, password] = Regex.run(@pattern, head)

    count =
      password
      |> String.graphemes()
      |> Enum.count(&(&1 == char))

    if count >= String.to_integer(min) and count <= String.to_integer(max) do
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

total = Part1.count_valid(data, 0)
IO.puts("There are a total of #{total} valid passwords")
