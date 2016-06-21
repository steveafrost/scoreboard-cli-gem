class Scoreboard::Scraper
  
  def games_scrape
    all_games = []
    scraped = Nokogiri::HTML(open("http://espn.go.com/mlb/scoreboard"))
  end
  
end