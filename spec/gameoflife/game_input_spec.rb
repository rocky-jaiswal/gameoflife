require_relative '../spec_helper'
require_relative '../../lib/gameoflife/game_input'
require_relative '../../lib/gameoflife/cell'
require_relative '../../lib/gameoflife/matrix'

module Gameoflife
  
  describe "GameInput" do
    
    it "should be setup a matrix properly" do
      game_input = GameInput.new
      game_input.height = 4
      game_input.width = 4
      
      cell = Cell.new
      cell.row = 2
      cell.column = 2
      cell.alive = true

      game_input.cells = [cell]

      matrix = game_input.setup_matrix

      matrix.height.should == 4
      matrix.width.should == 4
      matrix.cells.size.should == 16
      matrix.get_cell_at(2, 2).is_alive?.should be_true
      matrix.get_cell_at(2, 3).is_alive?.should be_false
      matrix.get_cell_at(2, 4).is_alive?.should be_false
    end

  end

end