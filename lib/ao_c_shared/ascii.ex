defmodule AoCShared.Ascii do
  alias AoCShared.Coord

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

  @doc """
  Turn a multiline ascii string into a map of coordinates and values at those coords

  The bottom left is {1,1}

  ## Examples
      iex> Ascii.to_map(
        \"""
        .7
        a.
        \""")
      %{
        {1,1} => "a",
        {1,2} => ".",
        {2,1} => ".",
        {2,2} => "7",
      }

  """
  @spec to_map(String.t) :: %{Coord.t => String.t}
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

  # NOTE assumes all rows & cols are same length. If that's not the case, need to change this to a Map |> length |> max sort of thing instead
  def to_map_with_size(ascii) do
    list_form =
      ascii
      |> AoCShared.clean
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)
      |> Enum.reverse

    board =
      for {row, row_num} <- Enum.with_index(list_form, 1),
          {col, col_num} <- Enum.with_index(row, 1)
      do
        {{col_num, row_num}, col}
      end
      |> Map.new

    y_max = list_form |> length
    x_max = list_form  |> hd |> length

    {board, 1..x_max, 1..y_max}
  end
end
