class PlayerAndField

  attr_accessor :player, :field

  def initialize player 
  	@player = player
  	@field = [0]*10
  end

  def player_place_ships number_of_ships = 5
  	player.place_ships field, number_of_ships
  end

  def player_make_turn oponent_field
  	player.make_turn oponent_field
  end

  def player_win_condition?
  	player.win_condition? field
  end

  def player_congratulate
  	player.congratulate
  end

  def player_show_field oponent_field
    player.show_field field, oponent_field
  end
end