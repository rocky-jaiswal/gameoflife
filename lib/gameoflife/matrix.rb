module Gameoflife
  
  class Matrix

    attr_reader :height, :width, :alive_cells

    def initialize(height, width, alive_cells)
      @height = height
      @width = width
      @alive_cells = alive_cells
    end

    def is_cell_alive?(cell)
      @alive_cells.each do |alive_cell|
        return true if cell == alive_cell
      end
      return false
    end

    def does_cell_exists?(cell)
      exists = true
      exists = false if cell.row < 1 || cell.column < 1 || cell.row > @height || cell.column > @width
      return exists
    end

  end

end