require_relative 'rules'
require_relative 'neighbourhood'
require_relative 'cell'
require_relative 'game_input'

module Gameoflife
  
  class GameEngine

    def initialize(game_input)
      @rules = [Loneliness.new, Sustenance.new, OverPopulation.new, Reproduction.new]
      @neighbourhood = Neighbourhood.new
      @game_input = game_input
    end
    
    def get_next_generation(matrix)
      next_gen_alive_cells = get_next_generation_alive_cells(matrix)
      next_gen_alive_cells.map{|cell| cell.alive = true}
      @game_input.cells = next_gen_alive_cells
      matrix = @game_input.setup_matrix
      return matrix
    end
    
    private

    def get_next_generation_alive_cells(matrix)
      next_gen_alive_cells = []
      
      matrix.cells.each do |cell|
        alive_neighbour_count = @neighbourhood.get_alive_neighbour_count(matrix, cell)
        next_gen_alive_cells << cell if should_live?(cell, alive_neighbour_count)
      end

      return next_gen_alive_cells
    end

    def should_live?(cell, alive_neighbour_count)
      live = false
      @rules.each{|rule| live = live || rule.send(:execute, cell, alive_neighbour_count)}
      return live
    end
    
  end
  
end
