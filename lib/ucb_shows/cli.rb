# My CLI Controller

class UCBShows::CLI
  
  def call
    puts "What's playing tonight at the Upright Citizens Brigade:"
    list_theaters
    main_menu
  end
  
  def list_theaters
    puts ""
    puts <<-DOC.gsub /^\s*/, ""
      1. UCB LA - Franklin Theater
      2. UCB LA - Sunset Theater
      3. UCB NY - Hell's Kitchen
      4. UCB NY - at SubCulture
    DOC
  end
  
  
  
  def main_menu
    input = nil
    while input != "exit"
      puts ""
      puts "Select a theater (1-4) for listings or 'exit' to exit:"
      input = gets.strip.downcase
      case input
      when "1"
        franklin_menu
        # @franklin = UCBShows::Show.franklin
      when "2"
        sunset_menu
      when "3"
        hk_menu
      when "4"
        subculture_menu
      when "exit"
        goodbye  
      else
        puts "WRONG! You can select a theater (1-4) or 'exit' to exit."
      end
    end
  end
  
  def franklin_menu
    input = nil
    while input != "exit"
      puts "Tonight at UCB Franklin:"
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
        call
      when "exit"
        goodbye
      else
        puts "WRONG! You can select a show ('1-4'), return to the main 'menu', or 'exit'."
      end
    end
  end
  
  def sunset_menu
    input = nil
    while input != "exit"
      puts "Tonight at UCB Sunset:"
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
        call
      when "exit"
        goodbye
      else
        puts "WRONG! You can select a show ('1-4'), return to the main 'menu', or 'exit'."
      end
    end
  end
  
  def hk_menu
    input = nil
    while input != "exit"
      puts "Tonight at UCB Hell's Kitchen:"
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
        call
      when "exit"
        goodbye
      else
        puts "WRONG! You can select a show ('1-4'), return to the main 'menu', or 'exit'."
      end
    end
  end
  
  def subculture_menu
    input = nil
    while input != "exit"
      puts "Tonight at UCB @ SubCulture:"
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
        call
      when "exit"
        goodbye
      else
        puts "WRONG! You can select a show ('1-4'), return to the main 'menu', or 'exit'."
      end
    end
  end
  
  def list_shows
    puts "1. Sentimental Lady: Guilty Pleasures"
    puts "2. ASSSSCAT"
  end
    
  def goodbye
    puts "Peace!"
  end
  
end