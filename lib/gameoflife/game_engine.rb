module Gameoflife
  
  class GameEngine
    def self.get_next_generation(height, width, alive_array)
      next_gen_alive_array = []
      (1..height).each do |h|
        (1..width).each do |w|
          already_alive = is_cell_alive?([h, w], alive_array)
          neighbours = get_neighbours(h, w, height, width)
          next_gen_alive_array << [h, w] if should_live?(already_alive, get_alive_neighbour_count(neighbours, alive_array))
        end
      end
      return next_gen_alive_array
    end
    
    def self.get_neighbours(h, w, height, width)
      neighbours = []
      neighbours << [h-1, w-1] if cell_exists?(h-1, w-1, height, width)
      neighbours << [h-1, w] if cell_exists?(h-1, w, height, width)
      neighbours << [h-1, w+1] if cell_exists?(h-1, w+1, height, width)
      neighbours << [h, w-1] if cell_exists?(h, w-1, height, width)
      neighbours << [h, w+1] if cell_exists?(h, w+1, height, width)
      neighbours << [h+1, w-1] if cell_exists?(h+1, w-1, height, width)
      neighbours << [h+1, w] if cell_exists?(h+1, w, height, width)
      neighbours << [h+1, w+1] if cell_exists?(h+1, w+1, height, width)
      return neighbours
    end
    
    def self.cell_exists?(h, w, height, width)
      exists = true
      exists = false if h < 1 || w < 1 || h > height || w > height
      return exists
    end
    
    def self.get_alive_neighbour_count(neighbours, alive_array)
      alive_neighbour_count = 0
      neighbours.each do |cell|
        alive_neighbour_count = (alive_neighbour_count + 1) if is_cell_alive?(cell, alive_array)
      end
      return alive_neighbour_count
      return grant_life_as_per_rules?(already_alive, alive_neighbour_count)
    end
    
    def self.should_live?(already_alive, alive_neighbour_count)
      should_live = false
      should_live =  false if already_alive && alive_neighbour_count < 2
      should_live =  true if already_alive && (alive_neighbour_count == 2 || alive_neighbour_count == 3)
      should_live =  false if already_alive && alive_neighbour_count > 3
      should_live =  true if !already_alive && alive_neighbour_count == 3
      return should_live
    end
    
    def self.is_cell_alive?(cell, alive_array)
      alive_array.each do |pair|
        return true if cell == pair
      end
      return false
    end
  end
  
end
