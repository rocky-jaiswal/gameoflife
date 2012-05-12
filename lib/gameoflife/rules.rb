require_relative 'cell'

module Gameoflife
  
  class Loneliness
    def execute(cell, alive_neighbour_count)
      return false if  cell.is_alive? &&   alive_neighbour_count <  2
    end
  end
  
  class Sustenance
    def execute(cell, alive_neighbour_count)
      return true if  cell.is_alive? &&   ( alive_neighbour_count == 2 || alive_neighbour_count == 3 )
    end
  end
  
  class OverPopulation
    def execute(cell, alive_neighbour_count)
      return false if  cell.is_alive? &&   alive_neighbour_count >  3
    end
  end
  
  class Reproduction
    def execute(cell, alive_neighbour_count)
      return true  if !cell.is_alive? &&   alive_neighbour_count == 3
    end
  end

end