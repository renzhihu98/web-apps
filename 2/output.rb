require_relative 'deal'
require_relative 'card'
require 'colorize'
# Created file 1/27/19 by Renzhi Hu
# Edited file 2/3/19 by Anna Yu : removed the class left just methods

# This file includes the methods for output. print_a_card outputs single card by passing a Card object parameter.
# print_rules prints out rules and instructions for SET game. scoreboard outputs the final scoreboard for each player.


# Created 1/27/2019 by Renzhi Hu
# Edited 1/30/2019 by Renzhi Hu. Changed from printing the whole array to just one card and translated output from
#   text to symbol.
# Edited 2/3/2019 by Renzhi Hu. Fixed length of the output array
# Edited 2/4/2019 by Renzhi Hu: added return value for testing
def print_a_card(card)
  str = ""
  # get the shading
  if card.shading == 'solid'
    shade = "*"
  elsif card.shading == 'striped'
    shade = "="
  else
    shade = " "
  end

  # get the symbol
  if card.symbol == 'diamond'
    sym = "<#{shade}>"
  elsif card.symbol == 'squiggle'
    sym = "{#{shade}}"
  else
    sym = "(#{shade})"
  end

  # print
  card.number.times {str += sym}
  if card.color == 'red'
    print str.ljust(10,' ').red
  elsif card.color == 'green'
    print str.ljust(10,' ').green
  else
    print str.ljust(10,' ').magenta
  end
  return str
end

# Created 2/1/2019 by Renzhi Hu
# Edited 2/3/19 by Anna Yu: adding in winning condition.
def print_rules
  puts %q[
    Here are the rules:

    There will be 12 cards on display. Each card contains four features:
    color (red, purple or green),
    shape (oval (), squiggle {} or diamond <>),
    number (1, 2 or 3)
    shading (solid *, striped = or open ).

    A SET is three cards where each feature, when looked at individually,
    is either all the same OR all different.

    The first player to see a SET, enters the three cards that make the SET.
    Player will be able to delete and reenter the card.
    The player will be awarded +-1 to their score depending on if it's a set.

    If none of the players see a SET, you have the option to add 3 more cards onto the board.

    To WIN : a player's score must achieve the selected goal score chosen from the start or the Deck is exhausted.
    ]
end

# Created 2/3/2019 by Renzhi Hu
# Print out the players' name and score and current winner
# Edited 2/3/19 by Anna Yu: return
def scoreboard
  puts "Scoreboard: "
  @player_names.each {|player| puts "#{player.name}: #{player.score}"}
  puts "Current winner is #{@player_names.sort_by(&:score).reverse[0].name}"
end
