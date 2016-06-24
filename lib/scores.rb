class Scoreboard::Scores
  
  attr_accessor :teams, :runs, :hits, :errors, :time
  
  def self.today
    self.scrape_scores
  end
  
  def self.scrape_scores
    scores = []

    doc = Nokogiri::HTML(open("http://espn.go.com/mlb/scoreboard"))
    binding.pry
    
    # first_score = self.new
    # first_score.teams = "Tigers, Royals"
    # first_score.runs = "1, 0"
    # first_score.hits = "10, 15"
    # first_score.errors = "1, 0"
    # first_score.time = "1:05PM"
    # 
    # second_score = self.new
    # second_score.teams = "Cubs, Nationals"
    # second_score.runs = "15, 9"
    # second_score.hits = "20, 18"
    # second_score.errors = "0, 0"
    # second_score.time = "7:15PM"
    # 
    # scores
  end
  
end