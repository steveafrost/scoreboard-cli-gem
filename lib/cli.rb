class Scoreboard::CLI
  
  def start
    welcome
    menu
    goodbye
  end
  
  def welcome
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Welcome to Scoreboard *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
  end
  
  def menu
    user_input = nil
    while user_input != "exit"
      list_games
      print "\nPlease enter the number of the game to see the details or type exit: "
      user_input = gets.strip.to_i
      
      if user_input > 0 && user_input <= @matchups.length
        box_score(user_input)
      else
        list_games
      end
    end
  end
  
  def list_games
    puts "\nYesterday's Games Around the MLB"
    @matchups = Scoreboard::Scores.today
    @matchups.each.with_index(1) do |matchup, index|
      puts "#{index}. #{matchup}"
    end
  end
  
  def box_score(user_input)
    user_input = user_input.to_i - 1
    
    teams = Scoreboard::Scores.scrape_teams(user_input)
    runs = Scoreboard::Scores.scrape_runs(user_input)
    hits = Scoreboard::Scores.scrape_hits(user_input)
    errors = Scoreboard::Scores.scrape_errors(user_input)
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