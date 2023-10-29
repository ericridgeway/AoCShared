defmodule AoCShared do
  def clean(input) do
    input
    |> String.trim
    |> String.replace("\r\n", "\n")
  end

  def clean_no_trim(input) do
    input
    |> String.replace("\r\n", "\n")
  end

  def split_rows(input) do
    input
    |> clean
    |> String.split("\n")
  end

  def loop(n_times, starting_input, reducer) do
    reducer_ignore_first_param = fn _, acc -> reducer.(acc) end
    Enum.reduce(1..n_times, starting_input, reducer_ignore_first_param)
  end

  def a(day_number), do: File.read!("day#{day_number}.txt")
end
