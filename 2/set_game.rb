# File Created 1/29/2019 by Leslie Zhou
# File edited 1/30/19 by Anna Yu
# File edited 1/30/19 by Renzhi Hu
# File edited 2/3/19 by Anna Yu
require 'colorize'
require_relative 'deal'
require_relative 'card'
require_relative 'output'
require_relative 'player_record'
require_relative 'checker'

  # Created 1/29/2019 by Leslie Zhou:
  # Edited 1/30 by Renzhi Hu: added welcome info. Deleted ask for player number and names.
  # Edited 1/30/19 by Anna Yu: line 17 rename to @name_array and remove line 20, 21 and 22.
  #   And move @new_deck and @playing inside here, removing line 8 and 9. Rename @playing to @player_set
  #   and @new_deck to @dealing_decks. Wrote comments about what should be done in initialization.
  # Edited 2/3/10 by Anna Yu: finished nearly all of update. moved input methods to update.
  class SetGame

    # Created 1/29/19 by Leslie Zhou
    # Edited 1/30/19 by Renzhi Hu:
    # Edited 2/3/19 by Anna Yu: new names for arrays and added state, check, quit and print welcome to game.
    #   Added in chose goal score step.
    def initialize
    # Ask for player number and player names with Leslie's input method.
      @quit = false
      @state = 23 # highest possible score
      @check = CheckerSet.new
      @dealing_decks = Deal.new # 2 Decks, 81 cards deck and in-play deck.
      @player_set = Array.new # Array of player chosen cards. MAX 3.
      @player_names=Array.new # Array of player
      initialInput # player numbers and names set
      @dealing_decks.deal_cards(12)
      # Goal Score
      print"What should the goal score be?(1-23, recommended 5): "
      @state = gets.chomp.to_i
      while !(1..23).include?@state
        print "Please enter something reasonable....\nWhat should the goal score be?(1-23, recommended 5): "
        @state = gets.chomp.to_i
      end
      # Welcome
      print "\n\n WELCOME TO THE GAME OF SET!\n\n"
      print_rules
      update
    end

  # Created 1/29/2019 by Leslie Zhou
  # Edited 1/30/19 by Anna Yu: Outlined update cycle with comments and started dealing.
  # Edited 2/3/19 by Anna Yu: Coded the game flow.
  # Edited 2/3/19 by Renzhi Hu: printed out cards in play
    def update
      score = 0

      while score!= @state&&!@quit&&@dealing_decks.deck.length>0

      # prints out 3 cards a line
     @dealing_decks.play.each_slice(3).to_a.each do |group|
       group.each do |card|
         print "#{@dealing_decks.play.index(card)+1}: "
         print_a_card(card)
       end
       puts " "
     end

    # Now PRINT the 12 or 15 cards in play and "FIND A SET OF 3! (P.S enter H for Help, Q to Quit, R to Restart): "
      print "FIND A SET OF 3! (h for help, q to quit, r to restart): \n\n"
    # Loop waiting for player set INPUT to be correct or SWITCH PLAYERS or QUIT or RESTART or HINT
      @code = askForCard # get 3 cards
     if @code == 1 # Restart
       initialize
       @quit = true
     elsif @code == 2 #Quit
       @quit = true
       puts "Thank you for playing! Here are your scores:"
       scoreboard
     else
       # PRINT OUT (num)PLAYER NAME, (num)PLAYER NAME ... then ask "WHO'S POINT WAS THIS? Enter their number.(NO CHEATING): "
       @player_names.each{|var| print "\nPlayer #{@player_names.index(var)+1}: #{var.name}\n"}
       print "Who answered? Please enter your player number (NO Cheating): "
       num = gets.chomp.to_i
       while !(1..@player_names.length).include? num
         print"ERROR: Nonexistent player number.\n Who answered? Please enter your player number (NO Cheating): \n"
         num = gets.chomp.to_i
       end
       score = result((@check.match?@player_set), @player_names[num-1])
       puts "#{@player_names[num-1].name} your current score is #{score}"
       @player_set = Array.new
       if score==@state || @dealing_decks.deck.length==0
        puts "Thank you for playing! Here are your scores:"
        scoreboard
       end
     end

      end

    end

  # Created 1/27/2019 by Renzhi Hu
  # Edited 2/3/19 by Anna Yu: changed name of method of result and added parameter of player.
    def result(result, player)
      if result
        player.score += 1
        puts "It's a set! \n#{player.name}, you got 1 more point!"
        @dealing_decks.rem_set(@player_set)
        @dealing_decks.deal_cards(3)
      else
        player.score -=1
        puts "It's not a set. \n#{player.name}, you lost a point!"
      end
      return player.score
    end


  #Created 1/30/2019 by Leslie Zhou
  #Edited 2/1/2019 by Leslie Zhou:Created the method to ask for cards from the user.
  #Edited 2/3/19 by Anna Yu: remove parameters and exchanged out the parameter names with arrays in SetGame.
  #   Changed conditional of while loop, and ask for player number outside method. Prints current choice deck.
  #   Changed puts to print.
  # Edited 2/3/19 by Celia Tang: added "d" input choice and deletion functionality
  #Return value: 1 for restart, 2 for quit, 3 for delete card from selection
    def askForCard
      n=0
      until @player_set.length == 3
        print "Player please choose a card number(H/h for help and R/r for Restart and Q/q for Quit and D/d to delete last card from your selection): "
        choice=gets.chomp
        while (!(1..@dealing_decks.play.length).include?choice.to_i)||(@player_set.include?(@dealing_decks.play[choice.to_i-1]))
          if choice.downcase =="r"
            return 1
          elsif choice.downcase =="q"
            return 2
          elsif choice.downcase == "d"
            del = @player_set.pop
            puts "Nothing to delete from selection!", n += 1 if del == nil
            n -= 1
            @player_set.each do |card|
              print "#{@player_set.index(card)+1}: "
              print_a_card(card)
            end
            print "Please enter a card number (H/h for help and R/r for Restart and Q/q for Quit and D/d to delete last card from your selection): "
            choice=gets.chomp
          elsif choice.downcase == "h"
            print_rules
            print "Please enter a card number (H/h for help and R/r for Restart and Q/q for Quit and D/d to delete last card from your selection): "
            choice=gets.chomp
          else
            print "ERROR not a valid card number! Please enter a card (H/h for help and R/r for Restart and Q/q for Quit and D/d to delete last card from your selection): "
            choice=gets.chomp
          end
        end
        @player_set[n]=@dealing_decks.play[choice.to_i-1]
        #Printing out choice set
        @player_set.each do |card|
          print "#{@player_set.index(card)+1}: "
          print_a_card(card)
        end
        n+=1
      end

    end

  #Created 1/30/2019 by Leslie Zhou: Created the method that ask for the number of players and their names before the game stars. And check if the player number is in the range(up to 4)
  #Edited 2/3/19 by Anna Yu : revert method back to taking input by gets. Create player objects. Remove parameters.
  #   Changed one puts to print.
    def initialInput
      print "Please enter the number of players from 1 to 4): "
      @action = gets.to_i
      while ![1,2,3,4].include?(@action)
        print "Error! Please enter a number from 1 to 4!: "
        @action = gets.to_i
      end
      n=0
      @action.times{
        print "Please enter the name for player #{n+1}: "
        @player_names[n]= Player.new(gets.chomp)
        puts "Welcome, #{@player_names[n].name}!"
        n+=1
      }

    end

end

# Start Game

SetGame.new
