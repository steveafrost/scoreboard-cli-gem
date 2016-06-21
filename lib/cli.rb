# CLI Controller

class Scoreboard::CLI
  
  # @@options = ["Scores", "Standings"]
  
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
    puts "\nToday's Games Around the MLB"
    @scores = Scoreboard::Scores.today
    @scores.each.with_index do |score, index|
      puts "#{index + 1}. #{score.teams}"
    end
  end
  
  def box_score(user_input)
    puts "\n"
    print @scores[user_input.to_i - 1].teams
    print " | Runs: #{@scores[user_input.to_i - 1].runs}"
    print " | Hits: #{@scores[user_input.to_i - 1].hits}"
    print " | Errors: #{@scores[user_input.to_i - 1].errors}"
    puts "\n"
  end
  
  def goodbye
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Thanks for using Scoreboard *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
  end
  
end