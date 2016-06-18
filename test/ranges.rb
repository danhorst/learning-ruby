#!/usr/bin/env ruby
require 'minitest/autorun'

class Ranges < Minitest::Test
  def test_inclusive_range
    literal = 1..3
    constructor = Range.new(1, 3)
    assert_equal [1, 2, 3], literal.to_a
    assert_equal [1, 2, 3], constructor.to_a
  end

  def test_exclusive_range
    subject = 1...3
    assert_equal [1, 2], subject.to_a
  end

  def test_alphabetical_range
    literal = 'a'..'c'
    constructor = Range.new('a', 'c')
    assert_equal ['a', 'b', 'c'], literal.to_a
    assert_equal ['a', 'b', 'c'], constructor.to_a
  end
end
