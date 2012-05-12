require_relative 'cell'

module Gameoflife
  
  class MatrixPrinter

    def print(matrix)
      line_count = 1
      line = ""
      matrix.cells.sort.each do |cell|
	if (cell.row.to_i) > line_count
  	  puts line
	  line = ""
  	  line_count = line_count + 1
  	end
	if cell.is_alive?
	  line = line + "|1"
	else
	  line = line + "|0"
	end
      end
      puts line
    end

  end

end