require_relative '../spec_helper'
require_relative '../../lib/gameoflife/cell'

module Gameoflife
  
  describe "Cell" do
    it "should be able to equate cells" do
      c1 = Cell.new
      c1.row = 2
      c1.column = 3
      
      c2 = Cell.new
      c2.row = 2
      c2.column = 3
      
      c3 = Cell.new
      c3.row = 3
      c3.column = 2
      
      c1.should == c2
      c2.should_not == c3
    end
  end
  
end
