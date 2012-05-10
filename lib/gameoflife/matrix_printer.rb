require_relative 'cell'

module Gameoflife
  
  class MatrixPrinter

    def print_matrix(matrix)
      line = 1
      matrix.cells.each do |cell|
	puts "|1" if cell.is_alive?
	puts "|0" unless cell.is_alive?
	if cell.row > line
	  puts "\n"
	  line = line + 1
	end
      end
    end

  end

end