require_relative 'gameoflife/version'
require_relative 'gameoflife/matrix_printer'
require_relative 'gameoflife/game_engine'
require_relative 'gameoflife/game_input'
require_relative 'gameoflife/matrix'

module Gameoflife

  private
  def self.get_matrix_height_and_width
    puts "Enter height of matrix:"
    height = gets
    puts "Enter width of matrix:"
    width = gets
    return height.to_i, width.to_i
  end

  def self.run_the_game(matrix)
    game_engine = GameEngine.new()
    matrix_printer = MatrixPrinter.new()
    
    while(true) do
      puts ""
      
      matrix_printer.print_matrix(matrix)
      alive_array = game_engine.get_next_generation(matrix)
      
      sleep 2
    end
  end
  
  puts "Welcome to the Game of Life!! Press Ctrl+C to exit anytime.."
  height, width = get_matrix_height_and_width
  
  game_input = GameInput.new
  alive_array = game_input.initialize_seeds

  game_input.height = height
  game_input.width = width
  game_input.alive_array = alive_array

  matrix = Matrix.new(height, width, alive_array)
  run_the_game(matrix)
  
end
