# CLI Controller

class Scoreboard::CLI
  
  @@options = ["Scores", "Standings"]
  
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
      options
      user_input = gets.strip
      case user_input
      when "1"
        scores
      when "2"
        standings
      end
    end
  end
  
  def options
    puts "\nPlease enter a number to choose an option or type exit\n"
    @@options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
    puts "\n"
  end
  
  def scores
    @scores = Scoreboard::Scores.today
  end
  
  def standings
    puts "\n"
    puts "These are standings"
  end
  
  def goodbye
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
    puts "*~* Thanks for using Scoreboard *~*"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
  end
  
end