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
