require_relative 'gameoflife/version'
require_relative 'gameoflife/matrix_printer'

module Gameoflife

  def self.get_width_and_height
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
  
  puts "Welcome to the Game of Life!! Press Ctrl+C to exit anytime.."
  width, height = get_width_and_height
  alive_array = get_seeds
  
  while(true) do
    puts ""
    Gameoflife::MatrixPrinter.new(width, height, alive_array).print_matrix
    alive_array = Gameoflife::GameEngine.get_next_generation(width, height, alive_array)
    sleep 2
  end
  
end
