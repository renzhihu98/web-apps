# file created 1/30/2019 by Renzhi Hu
# edited 2/3/19 by Renzhi Hu
# edited 2/4/19 by Renzhi Hu
require File.join(File.expand_path(File.dirname(__FILE__)), '../output.rb')
require_relative "../output"
require_relative "../card"
require "test/unit"

# This test file unit tests the output single card methods from output.rb file
class PrintTest < Test::Unit::TestCase
  # created 1/31/2019 by Renzhi Hu
  # edited 2/3/2019 by Renzhi Hu
  # edited 2/3/2019 by Renzhi Hu: edited assert_equal from directly accessing object's attributes to
  #   check return value because output.rb changed from class to file
  # test default card initialization
  def test_print_default_shading_symbol
  	c = Card.new('','','','')
    assert_equal "<*>", print_a_card(c), "Card number wrong"
  end

  # created 1/31/2019 by Renzhi Hu
  # edited 2/3/2019 by Renzhi Hu
  # edited 2/3/2019 by Renzhi Hu: edited assert_equal from directly accessing object's attributes to
  #   check return value because output.rb changed from class to file
  # regular test
  def test_print_shading_symbol
  	c = Card.new(1,'oval','open','purple')
    assert_equal "( )", print_a_card(c), "Card number wrong"
  end

  # created 2/3/2019 by Renzhi Hu
  # edited 2/3/2019 by Renzhi Hu: edited assert_equal from directly accessing object's attributes to
  #   check return value because output.rb changed from class to file
  # regular test with multiple cards
  def test_print_shading_symbol_multiple
    c = Card.new(2,'oval','open','purple')
    assert_equal "( )( )", print_a_card(c), "Card number wrong"
  end

  # created 2/3/2019 by Renzhi Hu
  # edited 2/3/2019 by Renzhi Hu: edited assert_equal from directly accessing object's attributes to
  #   check return value because output.rb changed from class to file
  # regular test with multiple cards
  def test_print_shading_symbol_multiple_2
    c = Card.new(3,'oval','open','purple')
    assert_equal "( )( )( )", print_a_card(c), "Card number wrong"
  end

end