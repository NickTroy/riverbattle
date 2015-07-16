class Computer < Player

  def place_ships field, number_of_ships = 5
    positions_of_ships = (0..9).to_a.sample(number_of_ships)
    positions_of_ships.each { |p| field[p] = 1 }
  end

  def make_turn field
    already_shot_positions = []
    field.each_with_index { |f, i| already_shot_positions << i if f == 2 }
    shoot_position_index = ((0..9).to_a - already_shot_positions).sample
    field[shoot_position_index] = 2
  end

  def congratulate
  	puts "What a shame! You managed to loose to a computer!!"
  end
end