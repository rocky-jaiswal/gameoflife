module Gameoflife
  
  class GameInput

    attr_accessor :height, :width, :alive_array

    def initialize_seeds
      user_input = "Y"
      alive_array = []
      while user_input != "N" do
        puts "Enter alive cells (Format : n,m) or n to exit:"
        user_input = gets.chomp
        process_user_input(user_input, alive_array)
      end
      return alive_array
    end

    private
    def process_user_input(user_input, alive_array)
      if user_input.upcase! != "N"
          inp = user_input.split(",")
          cell = Cell.new
          cell.row = inp[0].to_i
          cell.column = inp[1].to_i
          alive_array << cell
      end
    end

  end

end