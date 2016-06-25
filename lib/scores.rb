class Scoreboard::Scores
  
  attr_accessor :teams, :runs, :hits, :errors, :time
  
  def self.today
    self.scrape_matchups
  end
  
  def self.scrape_matchups
    teams = []
    #find a way to set date dynamically on end of string
    doc = Nokogiri::HTML(open("http://m.mlb.com/gdcross/components/game/mlb/year_2016/month_06/day_24/master_scoreboard.json"))
    
    data_hash = JSON.parse(doc)
    @each_game = data_hash["data"]["games"]["game"]
    
    i = 0
    while i < @each_game.length
      home_team = @each_game[i]["home_team_name"]
      away_team = @each_game[i]["away_team_name"]
      teams << "#{home_team} vs #{away_team}"
      i += 1
    end
    
    teams
  end
  
  def self.scrape_teams(i)
    home_team = @each_game[i.to_i - 1]["home_team_name"]
    away_team = @each_game[i.to_i - 1]["away_team_name"]
  end
  
  def self.scrape_time(i)
    time = @each_game[i.to_i - 1]["time"]
    "#{time}"
  end
  
  def self.scrape_runs(i)
    home_r = @each_game[i.to_i - 1]["linescore"]["r"]["home"]
    away_r = @each_game[i.to_i - 1]["linescore"]["r"]["away"]
    "#{home_r} #{away_r}"
  end
  
  def self.scrape_hits(i)
    home_h = @each_game[i.to_i - 1]["linescore"]["h"]["home"]
    away_h = @each_game[i.to_i - 1]["linescore"]["h"]["away"]
    "#{home_h} #{away_h}"
  end
  
  def self.scrape_errors(i)
    home_e = @each_game[i.to_i - 1]["linescore"]["e"]["home"]
    away_e = @each_game[i.to_i - 1]["linescore"]["e"]["away"]
    "#{home_e} #{away_e}"
  end
  
end