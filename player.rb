class Player

  def make_turn 
  end

  def place_ships
  end

  def win_condition? field
    !(field.include? 1)
  end

  def congratulate
  end

  def show_field field, oponent_field
  end

end
