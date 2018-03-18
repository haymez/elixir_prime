defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test "checks if factor" do
    assert Prime.is_factor?(10, 3) == false
    assert Prime.is_factor?(10, 5) == true
  end

  test "checks if number is prime" do
    assert Prime.is_prime?(1) == false
    assert Prime.is_prime?(2) == true
    assert Prime.is_prime?(3) == true
    assert Prime.is_prime?(10) == false
    assert Prime.is_prime?(5) == true
    assert Prime.is_prime?(4139) == true
    assert Prime.is_prime?(4135) == false
  end

  test "finds all primes in list" do
    assert Prime.primes_for(1..5) == [2, 3, 5]
  end

  test "finds all primes in list, concurrently" do
    assert Prime.find_primes(1..100) == [
             2,
             3,
             5,
             7,
             11,
             13,
             17,
             19,
             23,
             29,
             31,
             37,
             41,
             43,
             47,
             53,
             59,
             61,
             67,
             71,
             73,
             79,
             83,
             89,
             97
           ]
  end

  test "Splits list as evenly as possible" do
    assert Prime.split_list([1, 2, 3, 4, 5], 2) == [[1, 2, 3], [4, 5]]
    assert Prime.split_list([1, 2, 3, 4, 5], 3) == [[1, 2], [3, 4], [5]]
    assert Prime.split_list([1, 2, 3, 4, 5, 6, 7, 8], 3) == [[1, 2, 3], [4, 5, 6], [7, 8]]

    assert Prime.split_list(
             [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19],
             7
           ) == [
             [1, 2, 3],
             [4, 5, 6],
             [7, 8, 9],
             [10, 11, 12],
             [13, 14, 15],
             [16, 17, 18],
             [19]
           ]
  end
end
