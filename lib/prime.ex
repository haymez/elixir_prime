defmodule Prime do
  @moduledoc """
  Documentation for Prime.
  """

  @doc """
  Filters `range` to only include prime numbers

  ## Examples
  
      iex> Prime.primes_for(5..10)
      [5, 7]
  """
  def primes_for(range) do
    range
    |> Enum.filter(&is_prime?(&1))
  end

  def is_prime?(num) when num == 1, do: true
  def is_prime?(num) when num == 2, do: true
  def is_prime?(num) when rem(num, 2) == 0, do: false
  

  @doc """
  Tests if `num` is a prime number.

  ## Examples
  
      iex> Prime.is_prime?(5)
      true

      iex> Prime.is_prime?(9)
      false
  """
  def is_prime?(num) when is_integer(num) do
    not_prime =
      2..(num - 1)
      |> Enum.drop_every(2)
      |> Enum.any?(&is_factor?(num, &1))

    !not_prime
  end

  
  @doc """
  Tests if `potential_factor` is factor of `num`.

  ## Examples

      iex> Prime.is_factor?(18, 3)
      true

      iex> Prime.is_factor?(21, 10)
      false
  """
  # @spec is_factor?(number) :: integer
  def is_factor?(num, potential_factor) do
    rem(num, potential_factor) == 0
  end
end
