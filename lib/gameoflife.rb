require File.expand_path('../lib/gameoflife/version', File.dirname(__FILE__))
require File.expand_path('../lib/gameoflife/matrix_printer', File.dirname(__FILE__))

module Gameoflife
  puts "Welcome to the Game of Life!!"
  puts "Enter width of matrix:"
  width = gets
  puts "Enter height of matrix:"
  height = gets
  
  loop = "Y"
  alive_array = []
    
  while loop == "Y" do
    puts "Enter alive cells:"
    alive_cell = gets.chomp
    alive_array << alive_cell.split(",")
    puts "Enter Y/y to continue"
    loop = gets.chomp.upcase!
  end
  
  puts "Printing matrix..."
  puts ""
  
  Gameoflife::MatrixPrinter.new(width.to_i, height.to_i, alive_array).print_matrix
end
