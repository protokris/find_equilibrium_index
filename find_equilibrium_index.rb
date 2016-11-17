# A zero-indexed array A consisting of N integers is given. An equilibrium index of this array is any integer P such that 0 ≤ P < N and the sum of elements of lower indices is equal to the sum of elements of higher indices, i.e.
# A[0] + A[1] + ... + A[P−1] = A[P+1] + ... + A[N−2] + A[N−1].
# Sum of zero elements is assumed to be equal to 0. This can happen if P = 0 or if P = N−1.
#
# For example, consider the following array A consisting of N = 8 elements:
#
#   A[0] = -1
#   A[1] =  3
#   A[2] = -4
#   A[3] =  5
#   A[4] =  1
#   A[5] = -6
#   A[6] =  2
#   A[7] =  1
#
# P = 1 is an equilibrium index of this array, because:
#
# A[0] = −1 = A[2] + A[3] + A[4] + A[5] + A[6] + A[7]
# P = 3 is an equilibrium index of this array, because:
#
# A[0] + A[1] + A[2] = −2 = A[4] + A[5] + A[6] + A[7]
# P = 7 is also an equilibrium index, because:
#
# A[0] + A[1] + A[2] + A[3] + A[4] + A[5] + A[6] = 0
# and there are no elements with indices greater than 7.
#
# P = 8 is not an equilibrium index, because it does not fulfill the condition 0 ≤ P < N.
#
# Write a function:
#
# def solution(a)
# that, given a zero-indexed array A consisting of N integers, returns any of its equilibrium indices. The function should return −1 if no equilibrium index exists.
#
# For example, given array A shown above, the function may return 1, 3 or 7, as explained above.
#

def solution(a)
  raise ArgumentError, 'Argument is nil' if a.nil?
  raise ArgumentError, 'Argument is not array' unless a.is_a? Array

  left, right =0, a.inject(:+)

  a.each_with_index do |val, i|
    right = right - val
    return i if right == left
    left = left + val
  end

  -1
end


require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, solution([-1,3,-4,5,1,-6,2,1])
    assert_equal -1, solution([-1,3,-4])
  end
end
