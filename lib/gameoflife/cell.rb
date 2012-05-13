module Gameoflife

  class Cell
    include Comparable

    attr_accessor :row, :column, :alive

    def ==(another)
      @row == another.row && @column == another.column
    end
    
    def is_alive?
      return @alive
    end
    
    def <=>(another)
      if(@row == another.row)
        return @column <=> another.column
      else
        return @row <=> another.row
      end
    end

  end

end