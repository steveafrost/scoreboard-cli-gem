class Scoreboard::Scores
  
  attr_accessor :teams, :runs, :hits, :errors, :time
  
  def self.today
    self.scrape_matchups
  end
  
  def self.scrape_matchups
    teams = []
    
    #clock to get previous day so that we get those day's scores
    time = DateTime.now - 1
    day = time.strftime("%d")
    month = time.strftime("%m")
    year = time.strftime("%Y")
    
    #scrape of all matchups
    url = "http://m.mlb.com/gdcross/components/game/mlb/year_#{year}/month_#{month}/day_#{day}/master_scoreboard.json"
    doc = Nokogiri::HTML(open(url))
    
    #parsing the data down to the specific key values we need
    data_hash = JSON.parse(doc)
    @each_game = data_hash["data"]["games"]["game"]
    
    #loop through games, shovel teams into array, format array into quality string for user display
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
    team = []
    team << @each_game[i]["home_team_name"]
    team << @each_game[i]["away_team_name"]
  end
  
  def self.scrape_time(i)
    time = @each_game[i]["time"]
    "#{time}"
  end
  
  def self.scrape_runs(i)
    runs = []
    runs << @each_game[i]["linescore"]["r"]["home"]
    runs << @each_game[i]["linescore"]["r"]["away"]
    runs
  end
  
  def self.scrape_hits(i)
    hits = []
    hits << @each_game[i]["linescore"]["h"]["home"]
    hits << @each_game[i]["linescore"]["h"]["away"]
    hits
  end
  
  def self.scrape_errors(i)
    errors = []
    errors << @each_game[i.to_i - 1]["linescore"]["e"]["home"]
    errors << @each_game[i.to_i - 1]["linescore"]["e"]["away"]
    errors
  end
  
end