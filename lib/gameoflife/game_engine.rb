module Gameoflife
  
  class GameEngine
    def self.get_next_generation(height, width, alive_array)
      next_gen_alive_array = []
      (1..height).each do |h|
        (1..width).each do |w|
          already_alive = is_cell_alive?([h.to_s, w.to_s], alive_array)
          neighbours = get_neighbours(h, w, height, width)
          next_gen_alive_array << [h.to_s, w.to_s] if should_live?(already_alive, neighbours, alive_array)
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
    
    def self.should_live?(already_alive, neighbours, alive_array)
      alive_neighbour_count = 0
      neighbours.each do |cell|
        cell[0] = cell[0].to_s
        cell[1] = cell[1].to_s
        alive_neighbour_count = alive_neighbour_count + 1 if is_cell_alive?(cell, alive_array)
      end
      return grant_life_as_per_rules?(already_alive, alive_neighbour_count)
    end
    
    def self.grant_life_as_per_rules?(already_alive, alive_neighbour_count)
      should_live = false
      should_live =  false if already_alive && alive_neighbour_count < 2
      should_live =  true if already_alive && (alive_neighbour_count == 2 || alive_neighbour_count == 3)
      should_live =  false if already_alive && alive_neighbour_count > 3
      should_live =  true if !already_alive && alive_neighbour_count == 3
      return should_live
    end
    
    def self.is_cell_alive?(cell, alive_array)
      is_alive = false
      alive_array.each do |pair|
        is_alive = true if cell == pair
      end
      return is_alive  
    end
  end
  
end