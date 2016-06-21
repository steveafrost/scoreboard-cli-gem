class Scoreboard::Scraper
  
  def self.scrape_games
    all_games = []
    scraped_games = Nokogiri::HTML(open("http://espn.go.com/mlb/scoreboard"))
  end
  
end