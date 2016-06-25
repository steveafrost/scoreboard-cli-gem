class Scoreboard::Scores
  
  attr_accessor :teams, :runs, :hits, :errors, :time
  
  def self.today
    self.scrape_scores
  end
  
  def self.scrape_scores
    teams = []
    #find a way to set date dynamically on end of string
    doc = Nokogiri::HTML(open("http://m.mlb.com/gdcross/components/game/mlb/year_2016/month_06/day_24/master_scoreboard.json"))
    
    data_hash = JSON.parse(doc)
    each_game = data_hash["data"]["games"]["game"]
    
    i = 0
    while i < each_game.length
      home_team = each_game[i]["home_team_name"]
      away_team = each_game[i]["away_team_name"]
      teams << "#{home_team} vs #{away_team}"
      i += 1
    end
    
    teams
  end
  
  
  def self.scrape_time(i)
    time = each_game[i]["time"]
  end
  
  def self.scrape_runs(i)
    home_r = each_game[i]["linescore"]["r"]["home"]
    away_r = each_game[i]["linescore"]["r"]["away"]
  end
  
  def self.scrape_hits(i)
    home_h = each_game[i]["linescore"]["h"]["home"]
    away_h = each_game[i]["linescore"]["h"]["away"]
  end
  
  def self.scrape_errors(i)
    home_e = each_game[i]["linescore"]["e"]["home"]
    away_e = each_game[i]["linescore"]["e"]["away"]
  end
  
end