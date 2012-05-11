require_relative 'matrix'
require_relative 'cell'

module Gameoflife

  class Neighbourhood
    
    def get_alive_neighbour_count(matrix, cell)
      neighbours = get_neighbours(matrix, cell)
      alive_neighbour_count = 0
      neighbours.each do |cell|
        alive_neighbour_count = (alive_neighbour_count + 1) if cell.is_alive?
      end
      return alive_neighbour_count
    end
    
    private
     def get_neighbours(matrix, cell)
      neighbours = []
      neighbours << matrix.get_cell_at(cell.row - 1, cell.column - 1) if matrix.does_cell_exist_at(cell.row - 1, cell.column - 1)
      neighbours << matrix.get_cell_at(cell.row - 1, cell.column    ) if matrix.does_cell_exist_at(cell.row - 1, cell.column    )
      neighbours << matrix.get_cell_at(cell.row - 1, cell.column + 1) if matrix.does_cell_exist_at(cell.row - 1, cell.column + 1)
      neighbours << matrix.get_cell_at(cell.row    , cell.column - 1) if matrix.does_cell_exist_at(cell.row    , cell.column - 1)
      neighbours << matrix.get_cell_at(cell.row    , cell.column + 1) if matrix.does_cell_exist_at(cell.row    , cell.column + 1)
      neighbours << matrix.get_cell_at(cell.row + 1, cell.column - 1) if matrix.does_cell_exist_at(cell.row + 1, cell.column - 1)
      neighbours << matrix.get_cell_at(cell.row + 1, cell.column    ) if matrix.does_cell_exist_at(cell.row + 1, cell.column    )
      neighbours << matrix.get_cell_at(cell.row + 1, cell.column + 1) if matrix.does_cell_exist_at(cell.row + 1, cell.column + 1)
      return neighbours.compact
    end

  end

end