require_relative 'gameoflife/version'
require_relative 'gameoflife/matrix_printer'
require_relative 'gameoflife/game_engine'
require_relative 'gameoflife/game_input'
require_relative 'gameoflife/matrix'

module Gameoflife

  private
  def self.run_the_game_infinitely(matrix, game_engine, matrix_printer)
    while(true) do
      puts ""
      matrix_printer.print(matrix)
      matrix = game_engine.get_next_generation(matrix)
      sleep 3
    end
  end
  
  puts "Welcome to the Game of Life!! Press Ctrl+C to exit anytime.."
  
  game_input = GameInput.new
  game_engine = GameEngine.new
  matrix_printer = MatrixPrinter.new
  
  height, width = game_input.initialize_matrix_height_and_width
  seeds = game_input.initialize_seeds
  matrix = game_input.setup_matrix(height, width, seeds)
  
  run_the_game_infinitely(matrix, game_engine, matrix_printer)
  
end
