#!/usr/bin/env ruby
require 'minitest/autorun'

class Strings < Minitest::Test
  def test_interpolation
    variable = 'Fiz'
    single_quoted = '#{variable}Buz'
    double_quoted = "#{variable}Buz"
    assert_equal single_quoted, '#{variable}Buz'
    assert_equal double_quoted, 'FizBuz'
  end

  def test_substitution
    given = 'day'
    desired = 'pay'
    assert_equal given.tr('d', 'p'), desired
    assert_equal given.gsub(/d/, 'p'), desired
  end
end
