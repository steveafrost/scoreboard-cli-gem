# CLI Controller

class Scoreboard::CLI
  
  def start
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Welcome to Scoreboard! Please type 'scores' to see yesterday's MLB scores *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "\n"
    user_input = nil
    user_input = gets.strip
    case user_input
    when "scores"
      score_recap
    when "exit"
      exit
    else
      start
    end
  end
  
  def score_recap
    puts "\n"
    puts "Detroit Tigers 1"
    puts "Kansas City Royals 0"
    puts "------------------------"
    puts "Chicago Cubs 15"
    puts "Washington Nationals 9"
    puts "------------------------"
  end
  
end