ExUnit.start
Code.load_file "support.ex"

defmodule Ex02 do
  use ExUnit.Case
  import Support

  ##############################################################################
  # 2: 3 questions,  15 points available
  ##############################################################################

  # These exercises manipulate lists using anonymous functions.
  # Replace the text
  #
  #      your_anonymous_function(...)
  #
  # with your solution. Note that even though the placeholder
  # takes just one line, your solution may take several.
  #
  # You can test your answers by running:
  #
  #     elixir ex02.ex


  ##################
  # 2.1:  5 points #
  ########################################################################
  # Write an anonymous function that takes two numbers and returns a two #
  # element list. The first element of the list will be the sum of the   #
  # numbers, and second should be the difference                         #
  ########################################################################

  list2a = fn a, b -> [a+b, a-b] end

  assert list2a.(1, 2)    == [ 3, -1 ]
  assert list2a.(-1, 100) == [ 99, -101 ]
  assert list2a.(-1, -1) == [-2, 0]
  assert list2a.(-0.1, 0.1) == [0, -0.2]

  ##################
  # 2.2:  5 points #
  ##################################
  # Do the same using the & syntax #
  ##################################

  list2b = &([&1 + &2, &1 - &2])

  assert list2b.(1, 2)    == [ 3, -1 ]
  assert list2b.(-1, 100) == [ 99, -101 ]
  assert list2a.(-1, -1) == [-2, 0]
  assert list2a.(-0.1, 0.1) == [0, -0.2]

  ##################
  # 2.3:  5 points #
  ################################################################
  # Write a function that uses pattern matching to return true   #
  # if the first two elements of a list are equal                #
  ################################################################

  ###### 
  # Developer's note: I decided to handle anything aside from the truthy case with an _, instead of 
  # writing specific cases for multiple things, such as an empty list, a list with 1 element, 
  # a non-list, and so on.
  ######

  first2equal = fn
                [h,h|_] -> true
                _ -> false 
  end

  assert !first2equal.([])
  assert !first2equal.([1])
  assert first2equal.([4, 4, 5, 6, 7])
  assert !first2equal.([4, 5, 6, 7, 8])
  assert first2equal.([-4, -4, 6, 7, 8])
  assert !first2equal.([-4, 4, 6, 7, 8])
  assert !first2equal.(["a", "A", "b", "c"])
  assert first2equal.(["a", "a", "b", "c"])
  assert first2equal.(["_" , "_" , "b", 1])

end


