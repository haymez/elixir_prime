defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test "Tests if factor" do
    assert Prime.is_factor?(10, 3) == false
    assert Prime.is_factor?(10, 5) == true
  end

  test "Tests if number is prime" do
    assert Prime.is_prime?(1) == true
    assert Prime.is_prime?(2) == true
    assert Prime.is_prime?(3) == true
    assert Prime.is_prime?(10) == false
    assert Prime.is_prime?(5) == true
    assert Prime.is_prime?(5) == true
    assert Prime.is_prime?(4139) == true
    assert Prime.is_prime?(4135) == false
  end

  test "finds all primes in list" do
    assert Prime.primes_for(1..5) == [1, 2, 3, 5]
  end
end
