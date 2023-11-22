defmodule AoCSharedTest.CoordHelper do
  use ExUnit.Case

  alias AoCShared.CoordHelper
  alias AoCShared.Coord

  test "First coord in dir" do
    start = {1,1}
    x_range = 1..10
    y_range = 1..10

    dir_func = &Coord.right/1

    stop_looking_when_func = &(not Coord.in_range?(&1, x_range, y_range))
    found_collision_func = fn coord ->
      board = %{
        {7,1} => :knight
        {1,7} => :pawn
        {99,99} => :batman
      }

      if Map.has_key?(board, coord) do
        Map.get(board, coord)
      end
      case Map.get(board, coord) do
        ans -> ans
        nil -> nil
      end

      #alt (try rewriting the above checker with Enum.find_value. Not really important tho
      Enum.find_value(board, fn {coord, value} ->
        Map.get(board, coord)
      end)
    end
  end
end
