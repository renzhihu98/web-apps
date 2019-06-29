# File created 1-27-19 by Anna Yu
# Edited 1-29-19 by Anna Yu
class Card

  # Created 1-29-29 by Anna Yu
  # Edited 1/30/2019 by Anna Yu : compacted 4 lines of attr_reader to a line.
  # Edited 2/3/19 by Celia Tang: moved ranges var to outside of init
  attr_reader :color,:number, :shading, :symbol
  @@num_range = [1, 2, 3]
  @@sym_range = %w(diamond squiggle oval)
  @@shad_range = %w(solid striped open)
  @@color_range = %w(red green purple)

  # Created and edited 1-29-19 by Anna Yu
  # Edited 1-29-19 by Anna Yu removed else added defaults in beginning. Fixed array for sym, shad, color removed ','.
  # edited by Celia Tang 2/1/19: changed num_range, sym_range, shad_range, and color_rand to local vars
  # edited by Celia Tang 2/3/19: changed all ranges to class vars and moved outside of init
  def initialize(number, symbol, shading, color)

    @number = 1 # Number 1 by default
    @symbol = 'diamond' # Symbol diamond by default
    @shading = 'solid' # Shading solid by default
    @color = 'red' # Color red by default

    if @@num_range.include?(number)
      @number = number
    end

    if @@sym_range.include?(symbol)
      @symbol = symbol
    end

    if @@shad_range.include?(shading)
      @shading = shading
    end

    if @@color_range.include?(color)
      @color = color
    end
  end


end