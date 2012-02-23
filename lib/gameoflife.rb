require_relative 'gameoflife/version'
require_relative 'gameoflife/matrix_printer'
require_relative 'gameoflife/game_engine'

module Gameoflife

  def self.get_matrix_width_and_height
    puts "Enter width of matrix:"
    width = gets
    puts "Enter height of matrix:"
    height = gets
    return width.to_i, height.to_i
  end
  
  def self.get_seeds
    user_input = "Y"
    alive_array = []
    while user_input != "N" do
      puts "Enter alive cells (Format : n,m) or n to exit:"
      user_input = gets.chomp
      if user_input.upcase! != "N"
        alive_cells = user_input.split(",") 
        alive_array << [alive_cells[0].to_i, alive_cells[1].to_i]
      end
    end
    return alive_array
  end

  def self.run_the_game(width, height, alive_array)
    game_engine = GameEngine.new()
    matrix_printer = MatrixPrinter.new()
    
    while(true) do
      puts ""
      
      matrix_printer.print_matrix(width, height, alive_array)
      alive_array = game_engine.get_next_generation(width, height, alive_array)
      
      sleep 2
    end
  end
  
  puts "Welcome to the Game of Life!! Press Ctrl+C to exit anytime.."
  width, height = get_matrix_width_and_height
  alive_array = get_seeds
  run_the_game(width, height, alive_array)
  
end
