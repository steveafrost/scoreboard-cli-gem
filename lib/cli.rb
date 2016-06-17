# CLI Controller

class Scoreboard::CLI
  
  @@options = ["Scores", "Standings"]
  
  def start
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Welcome to Scoreboard *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    
    options
    user_input = nil
    user_input = gets.strip
    case user_input
    when "1"
      score_recap
    when "2"
      standings
    when "exit"
      exit
    else
      start
    end
  end
  
  def options
    puts "\nPlease enter a number to choose an option\n"
    @@options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
    puts "\n"
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
  
  def standings
    puts "\n"
    puts "These are standings"
  end
  
end