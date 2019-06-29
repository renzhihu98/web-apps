# Created by Kordell Stewart 1/28/2019
# Edited by Kordell Stewart 1/30/2019 - Complete redesign of Checker Class
# Ediited by Kordell Stewart 1/31/2019 - Issue resolution of incorrect set reports

require_relative 'card'

# Created by Kordell Stewart 1/28/2019
# Edited by Kordell Stewart 1/28/2019 - Complete redesign of match? method
# Edited by Kordell Stewart 2/3/19 - Compressed working cord for CheckerSet class
class CheckerSet
  # Takes in and checks input of three cards to determine if they are a set or not
  attr_reader :result
  # Created by Kordell Stewart 1/28/2019
  # Initialization of game checker with a nice welcome method
  def initialize
    @welcome = 'Lets see those sets!'
  end

  # Created by Kordell Stewart 1/31/2019
  # Updated by Kordell Stewart 2/1/2018 - redesign
  # Checks for a proper set out of a given array of three card objects
  def match?(choices)

    @choices = choices
    raise ArgumentError, 'Checker received non-card input' unless @choices.kind_of?(Array)
    raise ArgumentError, 'A set has 3 cards! Please select 3 cards!' unless @choices.size == 3

    # Logic: "MAKE THIS TERSE"
    numbers = Array.new(3) { |i| choices[i].number }
    symbols = Array.new(3) { |i| choices[i].symbol }
    shadings = Array.new(3) { |i| choices[i].shading }
    colors = Array.new(3) { |i| choices[i].color }

    features = [numbers, symbols, shadings, colors]
    @result = features.all? { |feature| feature.uniq.size != 2 }
  end
end

=begin
if numbers.uniq.size == 3 false
=end