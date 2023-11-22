defmodule AoCSharedTest.CoordHelper do
  use ExUnit.Case

  alias AoCShared.CoordHelper
  alias AoCShared.Coord

  test "First coord in dir" do
    start = {1,1}
    x_range = 1..10
    y_range = 1..10

    dir_func = &Coord.right/1

    give_up_when_func = &(not Coord.in_range?(&1, x_range, y_range))
    found_collision_func = fn target_coord ->
      board = %{
        {7,1} => :knight,
        {1,7} => :pawn,
        {99,99} => :batman,
      }

      Enum.find(fn {board_coord, _value} -> board_coord == target_coord end)
    end

    # TODO NOTE This might just end up in Coord module
    assert CoordHelper.first_in_direction(start, dir_func, give_up_when_func, found_collision_func) == {{7,1}, :knight}
  end
end
