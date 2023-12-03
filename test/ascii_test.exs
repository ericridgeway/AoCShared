defmodule AoCSharedTest.Ascii do
  use ExUnit.Case

  alias AoCShared.Ascii

  test "Ascii.to_map/1" do
    board = """
    123
    ...
    ...
    """
    |> Ascii.to_map

    assert Map.get(board, {1,1}) == "."
    assert Map.get(board, {3,3}) == "3"
  end

  test "Ascii.to_map_with_size/1" do
    {_board, x_range, y_range} = """
    123
    ...
    ...
    ...
    """
    |> Ascii.to_map_with_size

    assert x_range == 1..3
    assert y_range == 1..4
  end
end
