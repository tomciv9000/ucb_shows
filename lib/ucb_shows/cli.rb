# My CLI Controller

class UCBShows::CLI
  
  def call
    puts "Tonight at the Upright Citizens Brigade Theaters:"
    list_theaters
    menu
  end
  
  def list_theaters
    puts <<-DOC.gsub /^\s*/, ""
      1. UCB LA - Franklin Theater
      2. UCB LA - Sunset Theater
      3. UCB NY - Hell's Kitchen
      4. UCB NY - at SubCulture
    DOC
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Select a theater (1-4) for listings or 'exit' to exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More information about Franklin"
      when "2"
        puts "More information about Sunset"
      when "3"
        puts "More information about Hell's Kitchen"
      when "4"
        puts "More information about Subculture"
      when "theaters"
        list_theaters
      else
        puts "Hmmm, not sure what you meant.  Try 'theaters' or 'exit'."
      end
    end
  end
  
end