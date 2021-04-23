defmodule Passport do
  @enforce_keys [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]
  defstruct [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid]
end

defmodule Part1 do
  def count_valid(passports, total \\ 0)

  def count_valid(passports, total) when is_bitstring(passports) do
    passports =
      passports
      |> String.split("\n\n", trim: true)
      |> Enum.map(fn passport ->
        passport
        |> String.replace("\n", " ")
        |> String.split(" ", trim: true)
        |> Map.new(fn value ->
          [k, v] = value |> String.split(":")
          {String.to_existing_atom(k), v}
        end)
      end)

    count_valid(passports, total)
  end

  def count_valid([head | tail], total) do
    try do
      struct!(Passport, head)
      count_valid(tail, total + 1)
    rescue
      ArgumentError -> count_valid(tail, total)
    end
  end

  def count_valid([], total) do
    total
  end
end
