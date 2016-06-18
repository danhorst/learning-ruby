#!/usr/bin/env ruby
require 'minitest/autorun'

class Hashes < Minitest::Test
  def test_element_reference
    subject = { first: 1 }
    assert_equal 1, subject[:first]
  end

  def test_fetch
    subject = { second: 2 }
    assert_equal 2, subject.fetch(:second)
  end

  def test_fetch_with_missing_value
    subject = { third: 3 }
    assert_raises(KeyError) { subject.fetch(:missing) }
  end

  def test_fetch_with_default
    subject = { fourth: 4 }
    assert_equal 'default', subject.fetch(:missing, 'default')
  end

  # A hash only returns its default value when accessed using an element reference
  def test_default_value
    subject = Hash.new(5)
    assert_equal 5, subject[:missing]
    assert_raises(KeyError) { subject.fetch(:missing) }
  end

  # A Hash with a default value and other explicit values can serve as a lookup
  # table. Lookup tables can be used to replace case statements. See:
  # http://weblog.jamisbuck.org/2015/11/14/little-things-refactoring-with-hashes.html
  def test_default_value_with_specific_options
    subject = Hash.new('default').merge(specified: 6)
    assert_equal 6, subject[:specified]
    assert_equal 'default', subject[:missing]
  end
end
