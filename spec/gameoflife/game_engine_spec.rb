require_relative '../spec_helper'
require_relative '../../lib/gameoflife/neighbourhood'
require_relative '../../lib/gameoflife/cell'
require_relative '../../lib/gameoflife/rules'

module Gameoflife
  
  describe "Neighbours" do
    before(:each) do
      @neighbourhood = Neighbourhood.new
    end

    it "should get neighbours" do
      @neighbourhood.get_neighbours(1, 1, 3, 3).length.should == 3
      @neighbourhood.get_neighbours(2, 2, 3, 3).length.should == 8
      @neighbourhood.get_neighbours(2, 3, 3, 3).length.should == 5
    end

    it "should determine the number of alive neighbours" do
      @neighbourhood.get_alive_neighbour_count([[1, 1],[1, 2],[1, 3],[2, 1],[2, 3],[3, 1],[3, 2],[3, 3]], [[1,2],[2,1],[2,2]]).should == 2
      @neighbourhood.get_alive_neighbour_count([[1, 1],[2, 2],[1, 3],[2, 1],[2, 3]], [[1,2],[2,1],[2,2]]).should == 2
      @neighbourhood.get_alive_neighbour_count([[1, 2],[2, 1],[2, 2]], [[1,2],[2,1],[2,2]]).should == 3
    end
  end
  
  describe "Cell" do
    it "should check if a cell is alive or not" do
      Cell.is_alive?([1, 2], [[1, 2], [2, 2]]).should == true
      Cell.is_alive?([2, 2], [[1, 2], [2, 2]]).should == true
      Cell.is_alive?([3, 2], [[1, 2], [2, 2]]).should == false
    end

    it "should check if cell exists" do
      Cell.exists?(2, 2, 2, 2).should == true
      Cell.exists?(3, 3, 2, 2).should == false
      Cell.exists?(0, 0, 2, 2).should == false
      Cell.exists?(1, 1, 3, 3).should == true
    end
  end

  describe "Rules" do
    before(:each) do
      @rules = Rules.new
    end
      
    it "should grant life to next gen if rules allow" do
      @rules.should_live?(true, 2).should == true
      @rules.should_live?(true, 3).should == true
      @rules.should_live?(true, 1).should == false
      @rules.should_live?(true, 4).should == false
      @rules.should_live?(true, 3).should == true
      @rules.should_live?(false, 4).should == false
    end
  end

  
end

