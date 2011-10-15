require_relative '../spec_helper'
require_relative '../../lib/gameoflife/game_engine'

module Gameoflife
  
  describe GameEngine do
    describe "Neighbours" do
      it "should get neighbours" do
        GameEngine.get_neighbours(1, 1, 3, 3).length.should == 3
        GameEngine.get_neighbours(2, 2, 3, 3).length.should == 8
        GameEngine.get_neighbours(2, 3, 3, 3).length.should == 5
      end
      
      it "should check if cell exists" do
        GameEngine.cell_exists?(2, 2, 2, 2).should == true
        GameEngine.cell_exists?(3, 3, 2, 2).should == false
        GameEngine.cell_exists?(0, 0, 2, 2).should == false
        GameEngine.cell_exists?(1, 1, 3, 3).should == true
      end
    end
    
    describe "Life" do
      it "should check if a cell is alive or not" do
        GameEngine.is_cell_alive?([1, 2], [[1, 2], [2, 2]]).should == true
        GameEngine.is_cell_alive?([2, 2], [[1, 2], [2, 2]]).should == true
        GameEngine.is_cell_alive?([3, 2], [[1, 2], [2, 2]]).should == false
      end
      
      it "should determine if the cell should live in the next generation" do
        GameEngine.should_live?(true, [[1, 1],[1, 2],[1, 3],[2, 1],[2, 3],[3, 1],[3, 2],[3, 3]], [["1","2"],["2","1"],["2","2"]]).should == true
        
        GameEngine.should_live?(true, [[1, 1],[2, 2],[1, 3],[2, 1],[2, 3]], [["1","2"],["2","1"],["2","2"]]).should == true
        
        GameEngine.should_live?(false, [[1, 2],[2, 1],[2, 2]], [["1","2"],["2","1"],["2","2"]]).should == true
      end
      
      it "should grant life to next gen if rules allow" do
        GameEngine.grant_life_as_per_rules?(true, 2).should == true
        GameEngine.grant_life_as_per_rules?(true, 3).should == true
        GameEngine.grant_life_as_per_rules?(true, 1).should == false
        GameEngine.grant_life_as_per_rules?(true, 4).should == false
        GameEngine.grant_life_as_per_rules?(true, 3).should == true
        GameEngine.grant_life_as_per_rules?(false, 4).should == false
      end
    end
  end
  
end
