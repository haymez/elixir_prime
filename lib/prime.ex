defmodule Prime do
  @moduledoc """
  Provides a set of algorithms to quickly find prime numbers given a range of
  integers.
  """

  @doc """
  Splits `range` into sub lists to concurrently find all primes.
  Order is not guaranteed.
  """
  @spec find_primes(list) :: list
  def find_primes(range) do
    range
    |> Enum.to_list()
    |> split_list(:erlang.system_info(:schedulers))
    |> Enum.map(fn list -> Task.async(fn -> primes_for(list) end) end)
    |> Enum.map(&Task.await(&1))
    |> List.flatten()
  end

  @doc """
  Filters `range` to only include prime numbers

  ## Examples

      iex> Prime.primes_for(5..10)
      [5, 7]
  """
  @spec primes_for(list) :: list
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
  @spec is_prime?(integer) :: boolean
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
  @spec is_factor?(integer, integer) :: boolean
  def is_factor?(num, potential_factor) do
    rem(num, potential_factor) == 0
  end

  @doc """
  Splits `list` into `num` parts, as equally as possible.

  ## Examples

      iex> Prime.split_list([1,2,3,4], 2)
      [[1, 2], [3, 4]]
  """
  @spec split_list(list, integer) :: list
  def split_list(list, num) do
    chunk_size = length(list) / num
    list |> Enum.chunk_every(Float.ceil(chunk_size) |> Kernel.round())
  end
end
