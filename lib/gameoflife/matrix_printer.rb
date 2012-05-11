require_relative 'cell'

module Gameoflife
  
  class MatrixPrinter

    def print(matrix)
      #line = 1
      matrix.cells.sort.each do |cell|
	if cell.is_alive?
	  p "#{cell.row}|#{cell.column}|1"
	else
	  p "#{cell.row}|#{cell.column}|0"
	end
#  	if (cell.row) > line
#  	  puts "\n"
#  	  line = line + 1
#  	end
      end
    end

  end

end