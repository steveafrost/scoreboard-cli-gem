# CLI Controller

class Scoreboard::CLI
  
  attr_accessor :teams, :runs, :hits, :errors
  
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
      user_input = gets.strip
      
      if user_input.to_i > 0
        box_score(user_input)
      elsif user_input == "list"
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
    
    @teams = Scoreboard::Scores.scrape_teams(user_input)
    @runs = Scoreboard::Scores.scrape_runs(user_input)
    @hits = Scoreboard::Scores.scrape_hits(user_input)
    @errors = Scoreboard::Scores.scrape_errors(user_input)

    puts "\n"
    print @matchups[user_input]
    print " | Runs: #{@runs}"
    print " | Hits: #{@hits}"
    print " | Errors: #{@errors}"
    puts "\n"
  end
  
  def goodbye
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Thanks for using Scoreboard *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
  end
  
end