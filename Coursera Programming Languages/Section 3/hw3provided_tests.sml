fun test11 () = 
    [
      match(Const 13, Variable "my_var"),
      match(Unit, UnitP),
      match(Tuple [Const 13, Const 17], TupleP [Variable "my_var", Variable "other_var"])
    ]
fun test10 () =
    [
      check_pat(Variable "var"),
      check_pat(TupleP [Wildcard,Variable "var"]),
      check_pat(ConstructorP("my_constructor", Variable "my_var")),
      check_pat(TupleP [Wildcard,Variable "var",ConstructorP("my_constructor", Variable "var")]),
      check_pat (TupleP [Variable "my_var", Variable "my_var"])
    ]

(*
fun test10 () =
    [
      assertFalse("for repeated Variable name", check_pat (TupleP [Variable "my_var", Variable "my_var"])),
      assertFalse("for repeated Variable names with other patterns interspersed",
                  check_pat(TupleP [Variable "my_var", UnitP, Wildcard, Variable "my_var"])
		 ),
      assert("for non-repeated Variables names with other patterns interspersed",
             check_pat (TupleP [Variable "my_var", UnitP, Wildcard, Variable "other_var"])
            )
    ]
*)

fun test1 () =
    let val a = "Devil"
	val b = "b"
	val c = "Corn"
	val x = only_capitals([a,b,c])
    in
	x
    end

fun test3 () =
    let val a = "Devil"
	val b = "Wears"
	val c = "Prada"
    in
	[longest_string2([a,b,c]),longest_string2([])]
    end

fun test2 () =
    let val a = "Devil"
	val b = "b"
	val c = "Prada"
    in
	[longest_string1([a,b,c]),longest_string1([])]
    end

fun test3_4() =
    let val x = "The"
	val y = "Devil"
	val z = "wears"
	val a = "Prada"
	val xs = [x,y,z,a]
    in
	[longest_string3 xs, longest_string4 xs]
    end
fun test5 () = 
    let val x = "The"
	val y = "Devil"
	val z = "wears"
	val a = "Pradas"
	val xs = [x,y,z,a]
    in
	[longest_capitalized xs]
    end

fun test6 () =
    let val a = "Denis"
	val b = ""
    in 
	[rev_string a, rev_string b]
    end

fun test8 () =
    [
      all_answers ((fn x => NONE), [1, 2, 3, 4, 5]),
      all_answers((fn x => SOME [x, x*x]), [2, 5, 3, 4])
    ]
fun test9a () =
    [
      count_wildcards (TupleP [Wildcard,Variable "var"])=1,
      count_wildcards (TupleP [Wildcard, ConstP 3, Wildcard, UnitP, Wildcard])=3
    ]
fun test9b () =
    [
      count_wild_and_variable_lengths (TupleP [Wildcard,Variable "var"])=4
    ]
fun test9c () =
    [
      count_some_var ("this",Variable "this")=1,
      count_some_var ("this",Variable "that")=0
    ]

fun test9a () =
    [
      count_wildcards (TupleP [Wildcard,Variable "var"])=1,
      count_wildcards (TupleP [Wildcard, ConstP 3, Wildcard, UnitP, Wildcard])=3
    ]
fun test9b () =
    [
      count_wild_and_variable_lengths (TupleP [Wildcard,Variable "var"])=4
    ]
fun test9c () =
    [
      count_some_var ("this",Variable "this")=1,
      count_some_var ("this",Variable "that")=0
    ]
