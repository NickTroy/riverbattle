class Human < Player

  def place_ships field, number_of_ships = 5
    positions_of_ships = []
    puts "enter #{number_of_ships} positions of your ships(numbers from 0 to 9)"
    1.upto(number_of_ships)  do
      position = gets.chomp.to_i
      if position.is_a? Fixnum and ((0..9).to_a - positions_of_ships).include? position
        positions_of_ships << position  
      else
      	puts "incorrect position"
      	redo
      end
    end
    positions_of_ships.each { |p| field[p] = 1 }
  end

  def make_turn field
  	possible_shot_positions = []
  	field.each_with_index { |f, i| possible_shot_positions << i unless f == 2}
    puts "enter position on field where you want to shoot"
    shot_position = gets.chomp.to_i
    unless possible_shot_positions.include? shot_position
      puts "incorrect shoot position"
      make_turn field 
    end
    field[shot_position] = 2
  end

  def congratulate
  	puts "Congratulations! You won!!"
  end


end