require_relative 'cell'

module Gameoflife
  
  class MatrixPrinter

    def print_matrix(matrix)
      (1..matrix.height).each do |h|
        (1..matrix.width).each do |w|
          print "|0" unless Cell.is_alive?([h, w], matrix.alive_array)
          print "|1" if Cell.is_alive?([h, w], matrix.alive_array)
        end
        puts ""
      end
      puts "\n"
    end
  end

end
