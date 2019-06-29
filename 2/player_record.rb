# Created 1/27/2019 by Kordell Stewart
# This class is for keeping track of player records and score under a specific name
class Player
  def initialize(name)
    @name = name
    @score = 0
  end
  attr_accessor :score
  attr_reader :name
end
