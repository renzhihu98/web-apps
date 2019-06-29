# Created by Kordell Stewart 1/28/2019

require 'test/unit'
require_relative '../player_record'

class TestPlayer < Test::Unit::TestCase

  # Created by Kordell Stewart 1/28/2019
  # Tests basic name input
  def BasicTest
    player1 = Player.new("Kordell")
    assert_equal("Kordell", player1.name)
    assert_equal(0, player1.score)
  end

  # Created by Kordell Stewart 1/28/2019
  # Tests empty player profile
  def EmptyTest player1 = Player.new( "")
    assert_equal("", player1.name)
    assert_equal(0, player1.score)
  end
end
