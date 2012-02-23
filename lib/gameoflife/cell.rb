module Gameoflife

  class Cell

    def self.is_alive?(cell, alive_array)
      alive_array.each do |pair|
        return true if cell == pair
      end
      return false
    end

    def self.exists?(h, w, height, width)
      exists = true
      exists = false if h < 1 || w < 1 || h > height || w > height
      return exists
    end

  end

end