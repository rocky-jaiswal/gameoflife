module Gameoflife
  
  class Matrix

    attr_reader :height, :width, :cells

    def initialize(height, width, cells)
      @height = height
      @width = width
      @cells = cells
    end

    def does_cell_exist_at(row, col)
      exists = true
      exists = false if row < 1 || col < 1 || row > @height || col > @width
      return exists
    end
    
    def get_cell_at(row, column)
      @cells.each do |cell|
	return cell if cell.row == row && cell.column == column 
      end
    end

  end

end