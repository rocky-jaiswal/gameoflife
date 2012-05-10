module Gameoflife

  class Cell

    attr_accessor :row, :column, :alive

    def ==(another)
      @row == another.row && @column == another.column
    end
    
    def is_alive?
      return @alive
    end

  end

end