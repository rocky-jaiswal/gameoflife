module Gameoflife
  
  class GameInput
    
    def initialize_matrix_height_and_width
      puts "Enter height of matrix:"
      height = gets
      puts "Enter width of matrix:"
      width = gets
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
          cell = Cell.new
	  cell.row = row
	  cell.column = col
	  if !cells.include?(cell)
	    cell.alive = false
	    cells << cell
	  end
        end
      end
      matrix = Matrix.new(height, width, cells)
      return matrix
    end

    private
    def process_user_input(user_input, cells)
      if user_input.upcase! != "N"
          inp = user_input.split(",")
          cell = Cell.new
          cell.row = inp[0].to_i
          cell.column = inp[1].to_i
	  cell.alive = true
          cells << cell
      end
    end

  end

end