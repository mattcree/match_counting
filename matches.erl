-module(matches).
-export([boxes/1]).

boxes(MatchNum) when is_integer(MatchNum) ->
    Map = #{s => 0, m => 0, l => 0, r => 0},
    do_box_filling(Map, MatchNum).

do_box_filling(Map, Num) when Num >= 50 ->
    Amount = Num div 50,
    do_box_filling(maps:put(l, Amount, Map), Num - (Amount * 50));

do_box_filling(Map, Num) when Num >= 20 ->
    Amount = Num div 20,
    do_box_filling(maps:put(m, Amount, Map), Num - (Amount * 20));

do_box_filling(Map, Num) when Num >= 5 ->
    Amount = Num div 5,
    do_box_filling(maps:put(s, Amount, Map), Num - (Amount * 5));

do_box_filling(Map, Num) when Num < 5 ->
    maps:put(r, Num, Map).
