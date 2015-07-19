class Computer < Player

  attr_accessor :positions_of_ships, :already_shot_positions

  def initialize
    @positions_of_ships = []
    @already_shot_positions = []
  end

  def place_ships field, number_of_ships = 5
    positions_of_ships = (0..9).to_a.sample(number_of_ships)
    positions_of_ships.each { |p| field[p] = 1 }
  end

  def make_turn oponent_field, field
    shoot_position_index = ((0..9).to_a - already_shot_positions).sample
    oponent_field[shoot_position_index] += 2
    already_shot_positions << shoot_position_index
  end

  def congratulate
  	puts "What a shame! You managed to loose to a computer!!"
    puts "If you want to play again type Game.new.play"
  end
end