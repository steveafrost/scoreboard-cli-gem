class Scoreboard::Scores
  
  attr_accessor :teams, :runs, :hits, :errors, :time
  
  def self.today
    puts "\n"
    puts "Detroit Tigers 1"
    puts "Kansas City Royals 0"
    puts "------------------------"
    puts "Chicago Cubs 15"
    puts "Washington Nationals 9"
    puts "------------------------"
    
    first_score = self.new
    first_score.teams = "Tigers, Royals"
    first_score.runs = "1, 0"
    first_score.hits = "10, 15"
    first_score.errors = "1, 0"
    first_score.time = "1:05PM"
    
    first_score
  end
  
end