defmodule AoCShared.Ascii do

  # def to_map(ascii) do
  #   list_form =
  #     ascii
  #     |> AoCShared.clean
  #     |> String.split("\n")
  #     |> Enum.map(&String.graphemes/1)
  #     |> Enum.map(fn row -> Enum.map(row, &String.to_integer/1) end)
  #     |> Enum.reverse

  #   for {row, row_num} <- Enum.with_index(list_form, 1),
  #       {col, col_num} <- Enum.with_index(row, 1)
  #   do
  #     {{col_num, row_num}, col}
  #   end
  #   |> Map.new
  # end

  def to_map(ascii) do
    list_form =
      ascii
      |> AoCShared.clean
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)
      |> Enum.reverse

    for {row, row_num} <- Enum.with_index(list_form, 1),
        {col, col_num} <- Enum.with_index(row, 1)
    do
      {{col_num, row_num}, col}
    end
    |> Map.new
  end
end
