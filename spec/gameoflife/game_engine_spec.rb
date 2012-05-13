require_relative '../spec_helper'
require_relative '../../lib/gameoflife/game_engine'

module Gameoflife

  describe "GameEngine" do
    before(:each) do
      game_input = GameInput.new
      game_input.height = 3
      game_input.width = 3
      
      cell12 = Cell.new
      cell12.row = 1
      cell12.column = 2
      cell12.alive = true

      cell22 = Cell.new
      cell22.row = 2
      cell22.column = 2
      cell22.alive = true

      cell32 = Cell.new
      cell32.row = 3
      cell32.column = 2
      cell32.alive = true

      game_input.cells = [cell12, cell22, cell32]

      @matrix = game_input.setup_matrix
      @game_engine = GameEngine.new(game_input)
    end

    it "should get the next generation of matrix" do
      matrix = @game_engine.get_next_generation(@matrix)

      matrix.cells.each do |cell|
        cell.is_alive?.should be_true if cell.row == 2
        cell.is_alive?.should be_false if cell.row != 2
      end
    end
  end
  
end

