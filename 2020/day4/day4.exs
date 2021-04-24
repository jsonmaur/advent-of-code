defmodule Passport do
  @enforce_keys [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]
  defstruct [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid]

  def validate!(data) do
    Enum.each(Map.keys(data), fn value ->
      case value do
        :byr ->
          byr = String.to_integer(data.byr)

          if byr < 1920 or byr > 2002,
            do: raise(ArgumentError, "byr is invalid")

        :iyr ->
          iyr = String.to_integer(data.iyr)

          if iyr < 2010 or iyr > 2020,
            do: raise(ArgumentError, "iyr is invalid")

        :eyr ->
          eyr = String.to_integer(data.eyr)

          if eyr < 2020 or eyr > 2030,
            do: raise(ArgumentError, "eyr is invalid")

        :hgt ->
          case Regex.run(~r/^([0-9]+)(in|cm)$/, data.hgt) do
            [_, hgt, unt] ->
              hgt = String.to_integer(hgt)

              if (unt == "in" and (hgt < 59 or hgt > 76)) or
                   (unt == "cm" and (hgt < 150 or hgt > 193)),
                 do: raise(ArgumentError, "hgt is invalid")

            nil ->
              raise(ArgumentError, "hgt is invalid")
          end

        :hcl ->
          if not Regex.match?(~r/^#[0-9a-f]{6}$/, data.hcl),
            do: raise(ArgumentError, "hcl is invalid")

        :ecl ->
          if not Enum.member?(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"], data.ecl),
            do: raise(ArgumentError, "ecl is invalid")

        :pid ->
          if not Regex.match?(~r/^[0-9]{9}$/, data.pid),
            do: raise(ArgumentError, "pid is invalid")

        _ ->
          nil
      end
    end)

    data
  end
end

defmodule Aoc2020.Day4 do
  def count_valid(passports, strict \\ false, total \\ 0)

  def count_valid(passports, strict, total) when is_bitstring(passports) do
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

    count_valid(passports, strict, total)
  end

  def count_valid([head | tail], strict, total) do
    try do
      if strict do
        struct!(Passport, head) |> Passport.validate!()
      else
        struct!(Passport, head)
      end

      count_valid(tail, strict, total + 1)
    rescue
      ArgumentError -> count_valid(tail, strict, total)
    end
  end

  def count_valid([], _strict, total) do
    total
  end
end
