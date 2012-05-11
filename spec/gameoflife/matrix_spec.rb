require_relative '../spec_helper'
require_relative '../../lib/gameoflife/matrix'
require_relative '../../lib/gameoflife/cell'

module Gameoflife
  
  describe "Matrix" do
    it "should be tell if cell exists" do
      cells = [Cell.new, Cell.new, Cell.new, Cell.new]
      matrix = Matrix.new(2, 2, cells)
      
      matrix.does_cell_exist_at(2, 3).should be_false
    end
    
    it "should get the right cell" do
      c1 = Cell.new
      c1.row = 1
      c1.column = 1
      
      c2 = Cell.new
      c2.row = 1
      c2.column = 2
      
      c3 = Cell.new
      c3.row = 2
      c3.column = 1
      c3.alive = true
      
      c4 = Cell.new
      c4.row = 2
      c4.column = 2
      matrix = Matrix.new(2, 2, [c1, c2, c3, c4])
      
      matrix.get_cell_at(2, 1).is_alive?.should be_true
    end
  end
  
end
 
