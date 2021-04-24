defmodule Aoc2020.Day5 do
  def to_seat_id(seat, row \\ {0, 127}, column \\ {0, 7})

  def to_seat_id(seat, row, column) when is_bitstring(seat) do
    to_seat_id(seat |> String.graphemes(), row, column)
  end

  def to_seat_id(["F" | tail], {min, max}, column) do
    to_seat_id(tail, {min, floor(min + (max - min) / 2)}, column)
  end

  def to_seat_id(["B" | tail], {min, max}, column) do
    to_seat_id(tail, {ceil(max - (max - min) / 2), max}, column)
  end

  def to_seat_id(["R" | tail], row, {min, max}) do
    to_seat_id(tail, row, {ceil(max - (max - min) / 2), max})
  end

  def to_seat_id(["L" | tail], row, {min, max}) do
    to_seat_id(tail, row, {min, floor(min + (max - min) / 2)})
  end

  def to_seat_id([], {row, row_max}, {column, column_max}) do
    if row != row_max, do: raise("Unable to calculate row")
    if column != column_max, do: raise("Unable to calculate column")

    row * 8 + column
  end

  def highest_seat_id(seats) do
    seats
    |> Enum.map(&to_seat_id(&1))
    |> Enum.max()
  end

  def my_seat_id(seats) do
    seats = seats |> Enum.map(&to_seat_id(&1))

    open_seats =
      Enum.min(seats)..Enum.max(seats)
      |> Enum.to_list()
      |> Enum.filter(&(&1 not in seats))

    if length(open_seats) == 1 do
      open_seats |> List.first()
    else
      raise "Flight is not full, unable to find your seat"
    end
  end
end
