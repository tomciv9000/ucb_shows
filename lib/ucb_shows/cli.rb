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
        franklin_menu
        # @franklin = UCBShows::Show.franklin
      when "2"
        puts "More information about Sunset"
      when "3"
        puts "More information about Hell's Kitchen"
      when "4"
        puts "More information about Subculture"
      when "theaters"
        list_theaters
      else
        puts "WRONG! You can select a theater (1-4) or 'exit' to exit."
      end
    end
  end
  
  def franklin_menu
    input = nil
    while input != "exit"
      puts "Tonight's Schedule at UCB Franklin:"
      list_shows
      puts "Select a show for listings, 'menu', or 'exit'."
      input = gets.strip.downcase
      case input
      when "1"
        puts "More information about Show 1"
      when "2"
        puts "More information about Show 2"
      when "3"
        puts "More information about Show 3"
      when "4"
        puts "More information about Show 4"
      when "menu"
        list_theaters
        menu
      else
        puts "WRONG! You can select a show ('1-4'), return to the main 'menu', or 'exit'."
      end
    end
  end
  
  def list_shows
    puts "1. Sentimental Lady: Guilty Pleasures"
    puts "2. ASSSSCAT"
  end
    

end