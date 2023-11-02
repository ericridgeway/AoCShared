defmodule AoCSharedTest.Order do
  use ExUnit.Case

  alias AoCShared.Order

  defp set_of_3 do
    MapSet.new(~w(a b c))
  end


  test "all_lists/1" do
    assert set_of_3() |> Order.all_lists == MapSet.new([
      ~w(a b c),
      ~w(a c b),

      ~w(b a c),
      ~w(b c a),

      ~w(c a b),
      ~w(c b a),
    ])
  end

  test "all_sub_sets/2" do
    assert set_of_3() |> Order.all_sub_sets(2) == MapSet.new([
      MapSet.new(~w(a b)),
      MapSet.new(~w(a c)),
      MapSet.new(~w(b c)),
    ])
  end

  test "all_sub_lists/2" do
    assert set_of_3() |> Order.all_sub_lists(2) == MapSet.new([
      ~w(a b),
      ~w(b a),

      ~w(a c),
      ~w(c a),

      ~w(b c),
      ~w(c b),
    ])
  end
end
