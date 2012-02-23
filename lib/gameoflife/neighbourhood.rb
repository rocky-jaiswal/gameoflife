require_relative 'cell'

module Gameoflife

  class Neighbourhood

    def get_neighbours(h, w, height, width)
      neighbours = []
      neighbours << [h-1, w-1] if Cell.exists?(h-1, w-1, height, width)
      neighbours << [h-1, w] if Cell.exists?(h-1, w, height, width)
      neighbours << [h-1, w+1] if Cell.exists?(h-1, w+1, height, width)
      neighbours << [h, w-1] if Cell.exists?(h, w-1, height, width)
      neighbours << [h, w+1] if Cell.exists?(h, w+1, height, width)
      neighbours << [h+1, w-1] if Cell.exists?(h+1, w-1, height, width)
      neighbours << [h+1, w] if Cell.exists?(h+1, w, height, width)
      neighbours << [h+1, w+1] if Cell.exists?(h+1, w+1, height, width)
      return neighbours
    end
    
    def get_alive_neighbour_count(neighbours, alive_array)
      alive_neighbour_count = 0
      
      neighbours.each do |cell|
        alive_neighbour_count = (alive_neighbour_count + 1) if Cell.is_alive?(cell, alive_array)
      end
      
      return alive_neighbour_count
    end

  end

end