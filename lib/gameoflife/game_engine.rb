require_relative 'rules'
require_relative 'neighbourhood'
require_relative 'cell'
require_relative 'game_input'

module Gameoflife
  
  class GameEngine

    def initialize
      @rules = Rules.new
      @neighbourhood = Neighbourhood.new
      @game_input = GameInput.new
    end
    
    def get_next_generation(matrix)
      next_gen_alive_cells = []
      
      matrix.cells.each do |cell|
	alive_neighbour_count = @neighbourhood.get_alive_neighbour_count(matrix, cell)
	next_gen_alive_cells << cell if @rules.should_the_cell_live_in_the_next_generation?(cell, alive_neighbour_count)
      end
      
      next_gen_alive_cells.map{|cell| cell.alive = true}
      matrix = @game_input.setup_matrix(matrix.height, matrix.width, next_gen_alive_cells)
      
      return matrix
    end
    
  end
  
end
