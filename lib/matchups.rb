class MLBScoreboard::Matchups
  
  attr_accessor :teams, :runs, :hits, :errors, :time
  
  def self.today
    self.scrape_matchups
  end
  
  def self.url_constructor
    #clock to get previous day so that we get those day's scores
    time = DateTime.now - 1
    day = time.strftime("%d")
    month = time.strftime("%m")
    year = time.strftime("%Y")
    
    #scrape of all matchups
    "http://m.mlb.com/gdcross/components/game/mlb/year_#{year}/month_#{month}/day_#{day}/master_scoreboard.json"
  end
  
  def self.scrape_matchups
    url = self.url_constructor
    doc = Nokogiri::HTML(open(url))
    
    #parsing the data down to the specific key values we need
    data_hash = JSON.parse(doc)
    @each_game = data_hash["data"]["games"]["game"]
    
    #loop through games, shovel teams into array, format array into quality string for user display
    @each_game.collect do |game|
      home_team = game["home_team_name"]
      away_team = game["away_team_name"]
      "#{home_team} vs #{away_team}"
    end
  
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