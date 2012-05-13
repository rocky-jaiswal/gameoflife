require_relative '../spec_helper'
require_relative '../../lib/gameoflife/neighbourhood'
require_relative '../../lib/gameoflife/cell'
require_relative '../../lib/gameoflife/game_input'

module Gameoflife
  
  describe "Neighbourhood" do
    before(:each) do
      @neighbourhood = Neighbourhood.new

      game_input = GameInput.new
      game_input.height = 4
      game_input.width = 4
      
      cell22 = Cell.new
      cell22.row = 2
      cell22.column = 2
      cell22.alive = true

      cell23 = Cell.new
      cell23.row = 2
      cell23.column = 3
      cell23.alive = true

      game_input.cells = [cell22, cell23]

      @matrix = game_input.setup_matrix
    end

    it "should determine the number of alive neighbours" do
      cell11 = Cell.new
      cell11.row = 1
      cell11.column = 1

      cell12 = Cell.new
      cell12.row = 1
      cell12.column = 2

      cell42 = Cell.new
      cell42.row = 4
      cell42.column = 2

      @neighbourhood.get_alive_neighbour_count(@matrix, cell11).should == 1
      @neighbourhood.get_alive_neighbour_count(@matrix, cell12).should == 2
      @neighbourhood.get_alive_neighbour_count(@matrix, cell42).should == 0
    end
  end

end