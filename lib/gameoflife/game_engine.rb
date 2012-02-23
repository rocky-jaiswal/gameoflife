require_relative 'rules'
require_relative 'neighbourhood'
require_relative 'cell'

module Gameoflife
  
  class GameEngine

    def initialize
      @rules = Rules.new
      @neighbourhood = Neighbourhood.new
    end
    
    def get_next_generation(height, width, alive_array)
      next_gen_alive_array = []
      
      (1..height).each do |h|
        (1..width).each do |w|
          neighbours = @neighbourhood.get_neighbours(h, w, height, width)
          alive_neighbour_count = @neighbourhood.get_alive_neighbour_count(neighbours, alive_array)
          
          already_alive = Cell.is_alive?([h, w], alive_array)
          next_gen_alive_array << [h, w] if @rules.should_live?(already_alive, alive_neighbour_count)
        end
      end
      
      return next_gen_alive_array
    end
    
  end
  
end
