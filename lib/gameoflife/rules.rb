module Gameoflife

  class Rules

    def should_live?(already_alive, alive_neighbour_count)
      should_live = false
      should_live =  false if already_alive && alive_neighbour_count < 2
      should_live =  true if already_alive && (alive_neighbour_count == 2 || alive_neighbour_count == 3)
      should_live =  false if already_alive && alive_neighbour_count > 3
      should_live =  true if !already_alive && alive_neighbour_count == 3
      return should_live
    end

  end

end