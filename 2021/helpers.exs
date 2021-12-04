defmodule Aoc2021.Helpers do
  def read_input(file_name, to) do
    day = System.fetch_env!("DAY")
    base_dir = Path.dirname(__ENV__.file)

    stream =
      [base_dir, "day#{day}", file_name]
      |> Path.join()
      |> File.stream!()
      |> Stream.map(&String.trim/1)

    case to do
      :integer -> Stream.map(stream, &String.to_integer/1)
      _ -> stream
    end
  end
end
