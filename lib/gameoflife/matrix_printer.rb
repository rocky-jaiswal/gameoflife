require_relative 'cell'

module Gameoflife
  
  class MatrixPrinter

    def print_matrix(height, width, alive_array)
      (1..height).each do |h|
        (1..width).each do |w|
          print "|0" unless Cell.is_alive?([h, w], alive_array)
          print "|1" if Cell.is_alive?([h, w], alive_array)
        end
        puts ""
      end
      puts "\n"
    end
  end

end
