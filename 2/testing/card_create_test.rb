require 'test/unit'
require_relative '../card'

# File created 1-29-19 by Anna Yu
# File edited 2-1-19 by Anna Yu
class TestCardCreate < Test::Unit::TestCase

  # Created and edited 1-29-29 by Anna Yu
  # Edited 2-1-19 by Anna Yu: changed to test for non default values.
  # Test 1,regular non default input.
  def test_average
    a = Card.new(3, 'oval', 'open', 'purple')
    num = a.number
    symbol = a.symbol
    shade = a.shading
    color = a.color
    assert_equal(3, num, 'number is not 3')
    assert_equal('oval', symbol, 'symbol is not oval')
    assert_equal('open', shade, 'shading is not open')
    assert_equal('purple', color, 'color is not purple')
  end

  # Created and edited 1-29-29 by Anna Yu
  # Test 2, right type wrong value, 4, d, s, r
  def test_wrong_value
    a = Card.new(4, 'd', 's', 'r')
    @num = a.number
    @symbol = a.symbol
    @shade = a.shading
    @color = a.color
    assert_equal(1, @num, 'number is 4')
    assert_equal('diamond', @symbol, 'symbol is d')
    assert_equal('solid', @shade, 'shading is s')
    assert_equal('red', @color, 'color is r')
  end

  # Created and edited 1-29-29 by Anna Yu
  # Test 3, wrong type as parameter
  def test_wrong_type
    a = Card.new('r', 1, 2, 3)
    @num = a.number
    @symbol = a.symbol
    @shade = a.shading
    @color = a.color
    assert_equal(1, @num, 'number is r')
    assert_equal('diamond', @symbol, 'symbol is 1')
    assert_equal('solid', @shade, 'shading is 2')
    assert_equal('red', @color, 'color is 3')
  end

  # Created and edited 1-31-29 by Renzhi Hu
  # Test non default initialization
  def test_regular_2
    a = Card.new(2, 'oval', 'open', 'purple')
    @num = a.number
    @symbol = a.symbol
    @shade = a.shading
    @color = a.color
    assert_equal(2, @num, 'number is not 2')
    assert_equal('oval', @symbol, 'symbol is not oval')
    assert_equal('open', @shade, 'shading is not open')
    assert_equal('purple', @color, 'color is not purple')
  end
end