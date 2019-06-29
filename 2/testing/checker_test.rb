require 'test/unit'
require_relative '../checker'
require_relative '../card'

# Created by Kordell Stewart 1/28/2019
# Edited by Kordell Stewart 1/30/2019 - Complete redesign
class TestChecker < Test::Unit::TestCase
  # Created by Kordell Stewart 1/28/2019

  #  Basic Test of no card input
  def test_no_input
    assert_raise do
    ref = CheckerSet.new
    input = []
    result = ref.match?(input)
    puts result
    end
  end

  # Created by Kordell Stewart 1/28/2019
  #  Basic Test of insufficient card input
  def test_low_input
    sample = Card.new(1, 'diamond', 'solid', 'red')
    input = [sample]
    ref = CheckerSet.new
    assert_raise do
    result = ref.match?(input)
    puts result
    end
  end

  # Created by Kordell Stewart 1/28/2019
  #  Basic Test of a incorrect selection
  def test_incorrect_set
    sample1 = Card.new(1, 'diamond', 'solid', 'green')
    sample2 = Card.new(2, 'diamond', 'stripped', 'red')
    sample3 = Card.new(3, 'oval', 'open', 'purple')
    input1 = [sample1, sample2, sample3]
    out1 = CheckerSet.new
    assert_equal(false, out1.match?(input1))
  end

  # Created by Kordell Stewart 1/28/19
  # Basic same set input
  def test_same_set
    sample1 = Card.new(1, 'diamond', 'solid', 'green')
    input1 = [sample1, sample1, sample1]
    out1 = CheckerSet.new
    assert_equal(true, out1.match?(input1))
  end

  # Created by Kordell Stewart 1/28/19
  # Basic correct set input
  def test_correct_set
  sample1 = Card.new(1, 'diamond', 'solid', 'green')
  sample2 = Card.new(2, 'squiggle', 'striped', 'red')
  sample3 = Card.new(3, 'oval', 'open', 'purple')
  input1 = [sample1, sample2, sample3]
  out1 = CheckerSet.new
  assert_equal(true, out1.match?(input1))
  end

  # Created by Kordell Stewart 2/1/19
  # Basic incorrect set with symbols
  def test_incorrect_set_symbols
    sample1 = Card.new(1, 'diamond', 'solid', 'green')
    sample2 = Card.new(2, 'diamond', 'striped', 'red')
    sample3 = Card.new(3, 'oval', 'open', 'purple')
    input1 = [sample1, sample2, sample3]
    out1 = CheckerSet.new
    assert_equal(false, out1.match?(input1))
  end

  # Created by Kordell Stewart 2/1/19
  # Basic incorrect set with numbers
  def test_incorrect_set_numbers
    sample1 = Card.new(1, 'diamond', 'solid', 'green')
    sample2 = Card.new(2, 'oval', 'striped', 'red')
    sample3 = Card.new(2, 'squiggle', 'open', 'purple')
    input1 = [sample1, sample2, sample3]
    out1 = CheckerSet.new
    assert_equal(false, out1.match?(input1))
  end

  # Created by Kordell Stewart 2/1/19
  # Basic incorrect set with shading
  def test_incorrect_set_shading
    sample1 = Card.new(1, 'diamond', 'solid', 'green')
    sample2 = Card.new(2, 'oval', 'solid', 'red')
    sample3 = Card.new(2, 'squiggle', 'open', 'purple')
    input1 = [sample1, sample2, sample3]
    out1 = CheckerSet.new
    assert_equal(false, out1.match?(input1))
  end

  # Created by Kordell Stewart 2/1/19
  # Basic incorrect set with shading
  def test_incorrect_set_color
    sample1 = Card.new(1, 'diamond', 'solid', 'red')
    sample2 = Card.new(2, 'oval', 'striped', 'red')
    sample3 = Card.new(2, 'squiggle', 'open', 'purple')
    input1 = [sample1, sample2, sample3]
    out1 = CheckerSet.new
    assert_equal(false, out1.match?(input1))
  end
end