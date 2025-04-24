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

  test "all_sub_lists_plus_repeats/2" do
    width = 3
    start_pool_of_3 = MapSet.new(~w(a b c))

    expected =
      MapSet.new([
        ~w(a a a),
        ~w(a a b),
        ~w(a a c),

        ~w(a b a),
        ~w(a b b),
        ~w(a b c),

        ~w(a c a),
        ~w(a c b),
        ~w(a c c),


        ~w(b a a),
        ~w(b a b),
        ~w(b a c),

        ~w(b b a),
        ~w(b b b),
        ~w(b b c),

        ~w(b c a),
        ~w(b c b),
        ~w(b c c),


        ~w(c a a),
        ~w(c a b),
        ~w(c a c),

        ~w(c b a),
        ~w(c b b),
        ~w(c b c),

        ~w(c c a),
        ~w(c c b),
        ~w(c c c),
      ])

    assert Order.all_sub_lists_plus_repeats(start_pool_of_3, width) == expected
  end
end
