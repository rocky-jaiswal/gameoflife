module Gameoflife
  
  class GameInput
    
    attr_accessor :height, :width, :cells
    
    def initialize_matrix_height_and_width_manually
      puts "Enter height of matrix:"
      @height = gets.chomp.to_i
      puts "Enter width of matrix:"
      @width = gets.chomp.to_i
    end

    def initialize_seeds_manually
      user_input = "Y"
      @cells = []
      while user_input != "N" do
        puts "Enter alive cells (Format : n,m) or n to exit:"
        user_input = gets.chomp
        process_user_input(user_input)
      end
    end
    
    def setup_matrix
      (1..@height).each do |row|
        (1..@width).each do |col|
          add_cell(row, col, false)
        end
      end
      matrix = Matrix.new(@height, @width, @cells)
    end

    private
    def process_user_input(user_input)
      if user_input.upcase! != "N"
        inp = user_input.split(",")
        add_cell(inp[0].to_i, inp[1].to_i, true)
      end
    end
    
    def add_cell(row, col, alive)
      cell = Cell.new
      cell.row = row
      cell.column = col
      if !@cells.include?(cell)
        cell.alive = alive
        @cells << cell
      end
    end

  end

end