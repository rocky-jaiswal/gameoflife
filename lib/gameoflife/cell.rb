module Gameoflife

  class Cell

    attr_acccessor :row, :column

    def ==(another)
      @row == another.row && @column == another.column
    end

  end

end