module Gameoflife
  
  class MatrixPrinter
    
    def initialize(width, height, alive_array)
      @width = width
      @height = height
      @alive_array = alive_array  
    end
    
    def print_matrix
      #puts @alive_array.inspect
      (1..@height).each do |h|
        (1..@width).each do |w|
          print "|0" unless is_alive(h, w)
          print "|1" if is_alive(h, w)
        end
        puts ""
      end
    end
    
    private
    
    def is_alive(height, width)
      is_alive = false
      @alive_array.each do |pair|
        is_alive = true if [height.to_s, width.to_s] == pair
      end
      return is_alive  
    end
          
  end

end
