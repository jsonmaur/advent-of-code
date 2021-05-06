defmodule Aoc2020.Day8 do
  defp parse(data) do
    data
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [op, arg] = String.split(line, " ")
      %{op: op, arg: String.to_integer(arg), seen: false}
    end)
  end

  def execute(data, pos \\ 0, acc \\ 0)

  def execute(data, pos, acc) when is_bitstring(data) do
    execute(parse(data), pos, acc)
  end

  def execute(data, pos, acc) do
    case Enum.fetch(data, pos) do
      :error ->
        {:ok, acc}

      {:ok, instruction} ->
        if instruction.seen do
          {:nok, acc}
        else
          data = List.replace_at(data, pos, %{instruction | seen: true})

          case instruction.op do
            "nop" -> execute(data, pos + 1, acc)
            "acc" -> execute(data, pos + 1, acc + instruction.arg)
            "jmp" -> execute(data, pos + instruction.arg, acc)
            _ -> raise "`#{instruction.op}` is not a valid operation"
          end
        end
    end
  end

  def fix(data) when is_bitstring(data) do
    data = parse(data)
    fix(data, Enum.with_index(data))
  end

  def fix(data, [{head, index} | tail]) do
    head =
      case head.op do
        "nop" when head.arg != 0 -> %{head | op: "jmp"}
        "jmp" -> %{head | op: "nop"}
        _ -> nil
      end

    if head do
      case execute(List.replace_at(data, index, head)) do
        {:ok, acc} -> {:ok, acc, index + 1}
        {:nok, _} -> fix(data, tail)
      end
    else
      fix(data, tail)
    end
  end

  def fix(_data, []) do
    :error
  end
end
