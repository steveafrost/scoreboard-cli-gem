class Scoreboard::Scores
  
  attr_accessor :teams, :runs, :hits, :errors, :time
  
  def self.today
    self.scrape_scores
  end
  
  def self.scrape_scores
    scores = []

    #find a way to set date dynamically on end of string
    doc = Nokogiri::HTML(open("http://m.mlb.com/gdcross/components/game/mlb/year_2016/month_06/day_24/master_scoreboard.json"))
    
    data_hash = JSON.parse(doc)
    each_game = data_hash["data"]["games"]["game"][1] #change index
    
    # need iterations
    home_teams = each_game["home_team_name"]
    away_teams = each_game["away_team_name"]
    
    time = each_game["time"]
    
    home_r = each_game["linescore"]["r"]["home"]
    away_r = each_game["linescore"]["r"]["away"]
    
    home_h = each_game["linescore"]["h"]["home"]
    away_h = each_game["linescore"]["h"]["away"]
    
    home_e = each_game["linescore"]["e"]["home"]
    away_e = each_game["linescore"]["e"]["away"]
    
    binding.pry
    
    scores
  end
  
end