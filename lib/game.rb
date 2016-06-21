class Scoreboard::Game

  attr_accessor :teams
  
  def initialize(teams)
    @@all << teams
  end
  
  def self.all
    @@all
  end
  
end