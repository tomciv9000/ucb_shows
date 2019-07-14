# My CLI Controller

class UCBShows::CLI
  
  def call
    puts ""
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
    puts ""
    puts "Select a theater (1-4) for listings or 'exit' to exit:"
    input = gets.strip.downcase
    if input == "1"
      franklin_menu
      # @franklin = UCBShows::Show.franklin
    elsif input == "2"
      sunset_menu
    elsif input == "3"
      hk_menu
    elsif input == "4"
      subculture_menu
    elsif input == "exit"
      goodbye  
    else
      puts "WRONG! You can select a theater (1-4) or 'exit'."
    end
  end
  
  def franklin_menu
      puts "Tonight at UCB Franklin:"
      list_shows
      puts "Select a show for listings, 'menu', or 'exit'."
      input = gets.strip.downcase
      if input == "1"
        puts "More information about Show 1"
      elsif input == "2"
        puts "More information about Show 2"
      elsif input == "3"
        puts "More information about Show 3"
      elsif input == "4"
        puts "More information about Show 4"
      elsif input == "menu"
        call
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
      end
  end
  
  def sunset_menu
      puts "Tonight at UCB Sunset:"
      list_shows
      puts "Select a show for listings, 'menu', or 'exit'."
      input = gets.strip.downcase
      if input == "1"
        puts "More information about Show 1"
      elsif input == "2"
        puts "More information about Show 2"
      elsif input == "3"
        puts "More information about Show 3"
      elsif input == "4"
        puts "More information about Show 4"
      elsif input == "menu"
        call
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
      end
  end
  
  def hk_menu
      puts "Tonight at UCB Hell's Kitchen:"
      list_shows
      puts "Select a show for listings, 'menu', or 'exit'."
      input = gets.strip.downcase
      if input == "1"
        puts "More information about Show 1"
      elsif input == "2"
        puts "More information about Show 2"
      elsif input == "3"
        puts "More information about Show 3"
      elsif input == "4"
        puts "More information about Show 4"
      elsif input == "menu"
        call
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
      end
  end
  
  def subculture_menu
    puts "Tonight at UCB @ SubCulture:"
    list_shows
    puts "Select a show for listings, 'menu', or 'exit'."
    input = gets.strip.downcase
    if input == "1"
        puts "More information about Show 1"
      elsif input == "2"
        puts "More information about Show 2"
      elsif input == "3"
        puts "More information about Show 3"
      elsif input == "4"
        puts "More information about Show 4"
      elsif input == "menu"
        call
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
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