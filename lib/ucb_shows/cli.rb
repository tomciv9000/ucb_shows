# My CLI Controller

class UCBShows::CLI
  
  def call
    UCBShows::Scraper.scrape_venues
    start
  end
  
  def start
    list_theaters
    main_menu
  end
  
  def list_theaters
    puts ""
    puts "WHAT'S HAPPENING TONIGHT AT THE UPRIGHT CITIZENS BRIGADE?"
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
      puts ""
      puts "Tonight at UCB Franklin:"
      print_franklin
      puts ""
      puts "Select a show for listings, 'menu', or 'exit'."
      input = gets.strip.downcase
      if input.to_i > 0 
        the_show = UCBShows::Show.all_franklin[input.to_i-1]
        print_details(the_show)
      elsif input == "menu"
        start
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
        franklin_menu
      end
  end
  
  def sunset_menu
      puts ""
      puts "Tonight at UCB Sunset:"
      print_sunset
      puts ""
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
        start
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
      end
  end
  
  def hk_menu
      puts ""
      puts "Tonight at UCB Hell's Kitchen:"
      print_hk
      puts ""
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
        start
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
      end
  end
  
  def subculture_menu
    puts ""
    puts "Tonight at UCB @ SubCulture:"
    print_subculture
    puts ""
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
        start
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
      end
  end
    
  def goodbye
    puts ""
    puts "Bye-BYEEEEE!!!"
  end
  
  def print_franklin
    puts ""
    UCBShows::Show.all_franklin.each_with_index do |show, index| 
      puts "(#{index+1}) #{show.time} - #{show.name}"
    end
  end
  
  def print_sunset
    puts ""
    UCBShows::Show.all_sunset.each_with_index do |show, index| 
      puts "(#{index+1}) #{show.time} - #{show.name}"
    end
  end
  
  def print_hk
    puts ""
    UCBShows::Show.all_hk.each_with_index do |show, index| 
      puts "(#{index+1}) #{show.time} - #{show.name}"
    end
  end
  
  def print_subculture
    puts ""
    if UCBShows::Show.all_subculture.empty?
      puts "No shows!!! Bang on the keyboard, then press enter to return to main menu."
      input = gets.strip
      start
    else
      UCBShows::Show.all_subculture.each_with_index do |show, index| 
        puts "(#{index+1}) #{show.time} - #{show.name}"
      end
    end
  end
  
  def print_details(show)
    puts ""
    puts "----------- #{show.name} -----------"
    puts ""
    puts "Location:           #{show.venue}"
    puts "Time:               #{show.time}"
    puts "Price:              #{show.price}"
    puts "Status:             #{show.status}"
    puts "Website:            #{show.show_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{show.description}"
    puts ""
  end
  
end