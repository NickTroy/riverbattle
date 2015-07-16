require './game.rb'

describe Game do

  let!(:computer) { Computer.new }
  let!(:human) { Human.new }
  let!(:computer_and_field1) { PlayerAndField.new(computer) }
  let!(:human_and_field2) { PlayerAndField.new(human) }
  let!(:game) { Game.new(computer_and_field1, human_and_field2) }  	
  
  it 'should place ships for computer' do
    computer_and_field1.player_place_ships(4)
    expect(computer_and_field1.field.inject { |n, sum| sum + n }).to eq 4 
  end 

  it 'should make turn for computer' do
  	computer_and_field1.player_place_ships
  	shots = 7
    1.upto(shots) { computer_and_field1.player_make_turn computer_and_field1.field }
    already_shot = computer_and_field1.field.find_all {|f| f == 2}
    expect(already_shot.count).to eq shots
  end

  it 'should check the win condition' do
  	computer_and_field1.player_place_ships
  	1.upto(10) { computer_and_field1.player_make_turn computer_and_field1.field }
    expect(computer_and_field1.player_win_condition?).to eq true
  end
end
