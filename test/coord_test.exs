defmodule AoCSharedTest.Coord do
  use ExUnit.Case

  alias AoCShared.Coord

  test "Basic shift up, using normal up/right coord direction" do
    assert {1,1} |> Coord.up == {1,2}
  end

  test "Get all_adjacent" do
    assert Coord.all_adjacent({2,2}) == MapSet.new([
      {1,1},
      {1,2},
      {1,3},

      {2,1},
      {2,3},

      {3,1},
      {3,2},
      {3,3},
    ])
  end

  describe "in_range" do
    @x_range 1..10
    @y_range 1..2
    # TODO Doc note: range is inclusive

    test "Solidly in" do
      assert Coord.in_range?({2,2}, @x_range, @y_range)
    end

    test "Solidly out" do
      refute Coord.in_range?({0,0}, @x_range, @y_range)
      refute Coord.in_range?({99,99}, @x_range, @y_range)
    end

    test "Off only one of the edges" do
      refute Coord.in_range?({1,99}, @x_range, @y_range)
      refute Coord.in_range?({-99,1}, @x_range, @y_range)
    end
  end
end
