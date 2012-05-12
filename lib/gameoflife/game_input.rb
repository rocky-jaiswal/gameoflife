module Gameoflife
  
  class GameInput
    
    def initialize_matrix_height_and_width
      puts "Enter height of matrix:"
      height = gets.chomp
      puts "Enter width of matrix:"
      width = gets.chomp
      return height.to_i, width.to_i
    end

    def initialize_seeds
      user_input = "Y"
      cells = []
      while user_input != "N" do
        puts "Enter alive cells (Format : n,m) or n to exit:"
        user_input = gets.chomp
        process_user_input(user_input, cells)
      end
      return cells
    end
    
    def setup_matrix(height, width, cells)
      (1..height).each do |row|
        (1..width).each do |col|
          add_cell(row, col, false, cells)
        end
      end
      matrix = Matrix.new(height, width, cells)
    end

    private
    def process_user_input(user_input, cells)
      if user_input.upcase! != "N"
	inp = user_input.split(",")
	add_cell(inp[0].to_i, inp[1].to_i, true, cells)
      end
    end
    
    def add_cell(row, col, alive, cells)
      cell = Cell.new
      cell.row = row
      cell.column = col
      if !cells.include?(cell)
	cell.alive = alive
	cells << cell
      end
    end

  end

end