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
end
