require 'pry'
require 'rspec'

require_relative 'player.rb'
require_relative 'human.rb'
require_relative 'computer.rb'
require_relative 'player_and_field.rb'

class Game

  attr_accessor :player_and_field1, :player_and_field2
  
  def initialize 
  	puts <<-TEXT
Choose your turn position
If you want to be first, enter 1. Otherwise - enter 2.
TEXT
    1.upto(1) do 
    	turn_position = gets.chomp.to_i
      unless [1,2].include? turn_position
        puts "incorrect position"
        redo
      end 
      if turn_position == 1
    	  player1 = Human.new
    	  @player_and_field1 = PlayerAndField.new player1
    	  player_and_field1.player_place_ships
    	  player2 = Computer.new
    	  @player_and_field2 = PlayerAndField.new player2
    	  player_and_field2.player_place_ships
      else
    	  player1 = Computer.new
    	  @player_and_field1 = PlayerAndField.new player1
    	  player_and_field1.player_place_ships
    	  player2 = Human.new
    	  @player_and_field2 = PlayerAndField.new player2
    	  player_and_field2.player_place_ships
      end
    end
  end
  
  def play
    loop do
    	player_and_field1.player_make_turn player_and_field2.field
    	if player_and_field1.player_win_condition?
    		player_and_field1.player_congratulate
    		break
    	end
    	player_and_field2.player_make_turn player_and_field1.field
    	if player_and_field2.player_win_condition?
    		player_and_field2.player_congratulate
    		break
    	end
    end
  end

  
end