class MLBScoreboard::CLI

  def start
    welcome
    menu
    goodbye
  end
  
  def welcome
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Welcome to MLB Scoreboard *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
  end
  
  def menu
    list_games
    puts "\n"
    puts "Please enter the number of the game to see the details or type exit: "
    user_input = gets.strip.to_i
    
    if user_input > 0 && user_input <= @matchups.length
      box_score(user_input)
    elsif user_input > @matchups.length
      menu
    elsif user_input == "exit"
      exit
    else
      list_games
    end
  end
  
  def list_games
    puts "\nYesterday's Games Around the MLB"
    @matchups = MLBScoreboard::Matchups.today
    @matchups.each.with_index(1) do |matchup, index|
      puts "#{index}. #{matchup}"
    end
  end
  
  def box_score(user_input)
    user_input = user_input.to_i - 1
    
    teams = MLBScoreboard::Matchups.scrape_teams(user_input)
    runs = MLBScoreboard::Matchups.scrape_runs(user_input)
    hits = MLBScoreboard::Matchups.scrape_hits(user_input)
    errors = MLBScoreboard::Matchups.scrape_errors(user_input)
    home_line = [teams[0], runs[0], hits[0], errors[0]]
    away_line = [teams[1], runs[1], hits[1], errors[1]]
    
    rows = []
    rows << home_line
    rows << away_line
    
    table = Terminal::Table.new :headings => ['Team', 'R', 'H', 'E'], :rows => rows

    puts table
    
    puts "\nWould you like to see the list again or exit?"
    user_input = gets.strip
    if user_input == "exit"
      exit
    else
      menu
    end
    
  end
  
  def goodbye
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Thanks for using Scoreboard *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
  end
  
  
end