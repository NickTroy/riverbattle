class Human < Player

  attr_accessor :already_shot_positions, :positions_of_ships

  def initialize
    @already_shot_positions = []
    @positions_of_ships = []
  end

  def place_ships field, number_of_ships = 5
    puts "enter #{number_of_ships} positions of your ships(numbers from 0 to 9)"
    1.upto(number_of_ships)  do
      position = gets.chomp.to_i
      if ((0..9).to_a - positions_of_ships).include? position
        positions_of_ships << position  
      else
      	puts "incorrect position"
      	redo
      end
    end
    positions_of_ships.each { |p| field[p] = 1 }
  end

  def make_turn oponent_field, field
  	puts "enter position on field where you want to shoot"
    shoot_position = gets.chomp
    if shoot_position_is_correct? shoot_position then
      oponent_field[shoot_position.to_i] += 2
      already_shot_positions << shoot_position.to_i
    else
      show_field field, oponent_field
      puts "incorrect shoot position"
      make_turn oponent_field, field
    end
  end

  def show_field field, oponent_field
    system "clear"
    puts "0 - cell on a board, that hasn't been shoot yet, without ship"
    puts "1 - cell on a board, that hasn't been shoot yet, with ship"
    puts "2 - cell on a board, that has been shoot, without ship"
    puts "3 - cell on a board, that has been shoot, with ship"
    puts "* - cell on a board, that you can't see(sorry it's oponent field ;])"
    puts "Your field looks like:"
    p field
    oponent_field_to_show = ["*"]*10
    already_shot_positions.each { |i| oponent_field_to_show[i] = oponent_field[i] }
    puts "Your oponent's field looks like:"
    p oponent_field_to_show
  end

  def shoot_position_is_correct? shoot_position
    shoot_position.size == 1 and shoot_position.match(/\d/) and 
    ((0..9).to_a - already_shot_positions).include? shoot_position.to_i
  end

  def congratulate
    puts "Congratulations! You win!!"
    puts "If you want to play again type Game.new.play"
  end

end