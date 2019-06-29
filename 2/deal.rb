#file created by Celia Tang 1/28/19
require_relative "card"
class Deal
  #initialize deck and play card arrays
  # created by Celia Tang on 1/28/19
  # edited by Celia Tang on 2/1/19: changed the range variables to local vars and made the for loops into Array.each to make more concise
  # edited by Celia Tang on 2/3/19: deleted local range vars instead get class var from card and changed shuffle to shuffle!
  def initialize
    @deck, @play= Array.new, Array.new
    Card.class_variable_get(:@@num_range).each { |n| Card.class_variable_get(:@@sym_range).each { |s| Card.class_variable_get(:@@shad_range).each { |sh| Card.class_variable_get(:@@color_range).each { |c| deck.push Card.new n, s, sh, c  }  }  }  }

    @deck.shuffle!
  end
  #removes num cards from deck and puts into playing field if there are enough cards left,
  # created by Celia Tang on 1/28/19
  # edited by Celia Tang on 1/28/19: changed function so that the number of cards dealt is generic
  def deal_cards (num)
    num.times{@play.push @deck.pop} if @deck.length >= num
  end

  # removes cards from @play array given in passed array
  # created and edited by Celia Tang on 2/1/19: changed method so that the elements aren't removed by indices
  # edited by Celia Tang 2/3/19: made more concise by using Array.map method and changed method so accepts array of card objects as input
  def rem_set (set)
    @play -= set if @play.length >= set.length
  end

  #get decks for testing methods and during gameplay, created by Celia Tang on 1/29/19
  # edited by Celia Tang 2/3/19 make it one line to be more concise
  attr_reader :deck, :play




end