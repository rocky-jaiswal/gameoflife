require_relative 'game_engine'

module Gameoflife
  
  class MatrixPrinter
    def initialize(height, width, alive_array)
      @height = height
      @width = width
      @alive_array = alive_array  
    end
    
    def print_matrix
      (1..@height).each do |h|
        (1..@width).each do |w|
          print "|0" unless Gameoflife::GameEngine.is_cell_alive?([h, w], @alive_array)
          print "|1" if Gameoflife::GameEngine.is_cell_alive?([h, w], @alive_array)
        end
        puts ""
      end
      puts "\n"
    end
  end

end
