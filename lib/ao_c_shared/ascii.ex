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
end
