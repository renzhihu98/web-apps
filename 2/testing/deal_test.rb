#file created by Celia Tang 1/28/19
require_relative "../deal"
require "test/unit"

class DealTest < Test::Unit::TestCase

  #created by Celia Tang on 1/29/19
  # tests initialization of deal object length
  def test_init_length
    d = Deal.new
    play, deck = d.play, d.deck
    assert_equal 81, deck.length, "Deck length wrong:init"
    assert_equal 0, play.length, "Play length wrong:init"
  end

  #created by Celia Tang on 2/1/19
  # tests initialization of deal object has all card objects
  def test_init_length_type
    d = Deal.new
    deck= d.deck
    assert_equal true, deck.all? {|c| c.instance_of? Card}
  end

  #created by Celia Tang on 1/29/19
  # tests moving of 12 cards to play
  def test_deal_12
    d = Deal.new
    d.deal_cards 12
    play, deck = d.play, d.deck
    assert_equal 69, deck.length, "Deck length wrong:deal3"
    assert_equal 12, play.length, "Play length wrong:deal3"
  end

  #created by Celia Tang on 1/29/19
  # tests moving of 3 cards to play
  def test_deal_3
    d = Deal.new
    d.deal_cards 3
    play, deck = d.play, d.deck
    assert_equal 78, deck.length, "Deck length wrong:deal3"
    assert_equal 3, play.length, "Play length wrong:deal3"
  end

  #created by Celia Tang on 1/29/19
  # tests drawing on empty deck
  def test_deal_overdraw
    d = Deal.new
    d.deal_cards 81
    ret = d.deal_cards 3
    assert_equal nil, ret, "overdraw is not nil"
  end

  #created by Celia Tang on 1/29/19
  # tests drawing exact num of cards left in deck
  def test_deal_3_left
    d = Deal.new
    d.deal_cards 78
    ret = d.deal_cards 3
    assert_equal 3, ret, "didn't draw 3 cards left"
  end

  #created and edited by Celia Tang on 2/1/19
  # tests removing cards from playing field
  # edited 2/3/19 by Celia Tang: input to method is array of cards
  def test_rem_set
    d = Deal.new
    d.deal_cards 20
    init_length = d.play.length
    set = [d.play[5], d.play[7], d.play[12]]
    exp_set = d.play - set
    ret = d.rem_set set
    assert_equal exp_set, ret, "didn't remove cards from play"
    assert_equal init_length - set.length, d.play.length
  end

  #created and edited by Celia Tang on 2/1/19
  # tests removing too many cards from playing field
  # edited 2/3/19 by Celia Tang: input to method is array of cards
  def test_rem_set_over
    d = Deal.new
    d.deal_cards 3
    init_length = d.play.length
    set = [d.play[3], d.play[4], d.play[5], d.play[6]]
    ret = d.rem_set set
    assert_equal nil, ret, "didn't remove cards from play over"
    assert_equal init_length, d.play.length
  end

end