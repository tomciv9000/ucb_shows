# My CLI Controller

class UCBShows::CLI
  
  def call
    UCBShows::Scraper.scrape_venues
    start
  end
  
  def start
    list_theaters
  end
  
  def list_theaters
    puts ""
    puts "WHAT'S PLAYING TONIGHT AT THE UPRIGHT CITIZENS BRIGADE?"
    puts ""
    venues = UCBShows::Venue.all
    venues.each_with_index{|venue, i| puts "#{i+1}. #{venue.name}"}
    puts ""
    puts "Select a theater for listings or 'exit' to exit:"
    input = gets.strip.downcase
    
    #this is me trying something, not tested------------------------------
    if input.to_i <= (venues.length) && != 0
      print_showtimes(input.to_i - 1)
    #---------------------------------------------------------------------
    #if input == "1"
    #  franklin_menu
    #elsif input == "2"
    #  sunset_menu
    #elsif input == "3"
    #  hk_menu
    #elsif input == "4"
    #  subculture_menu
    elsif input == "exit"
      goodbye  
    else
      puts "WRONG! You can select a theater (1-4) or 'exit'."
    end
  end
  
  def print_showtimes(venue_index)
    venue = UCBShows::Venue.all[venue_index]
    puts "TONIGHT AT #{venue.name.upcase}:"
    venue.shows.each_with_index do |show|
      puts "(#{index+1}) #{show.time} - #{show.name}"
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
        puts ""
        puts "Would you like to see details on another show? Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
          puts ""
          franklin_menu
        elsif input == "n"
          goodbye
        else
          puts ""
          puts "I don't understand that answer."
          franklin_menu
        end
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
      if input.to_i > 0 
        the_show = UCBShows::Show.all_sunset[input.to_i-1]
        print_details(the_show)
        puts ""
        puts "Would you like to see details on another show? Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
          puts ""
          sunset_menu
        elsif input == "n"
          goodbye
        else
          puts ""
          puts "I don't understand that answer."
          sunset_menu
        end
      elsif input == "menu"
        start
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
        sunset_menu
      end
  end
  
  def hk_menu
      puts ""
      puts "Tonight at UCB Hell's Kitchen:"
      print_hk
      puts ""
      puts "Select a show for listings, 'menu', or 'exit'."
      input = gets.strip.downcase
      if input.to_i > 0 
        the_show = UCBShows::Show.all_hk[input.to_i-1]
        print_details(the_show)
        puts ""
        puts "Would you like to see details on another show? Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
          puts ""
          hk_menu
        elsif input == "n"
          goodbye
        else
          puts ""
          puts "I don't understand that answer."
          hk_menu
        end
      elsif input == "menu"
        start
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
        hk_menu
      end
  end
  
  def subculture_menu
    puts ""
    puts "Tonight at UCB @ SubCulture:"
    print_subculture
    puts ""
    puts "Select a show for listings, 'menu', or 'exit'."
    input = gets.strip.downcase
      if input.to_i > 0 
        the_show = UCBShows::Show.all_subculture[input.to_i-1]
        print_details(the_show)
        puts ""
        puts "Would you like to see details on another show? Enter Y or N"
        input = gets.strip.downcase
        if input == "y"
          puts ""
          subculture_menu
        elsif input == "n"
          goodbye
        else
          puts ""
          puts "I don't understand that answer."
          subculture_menu
        end
      elsif input == "menu"
        start
      elsif input == "exit"
        goodbye
      else
        puts "WRONG! You can select a show, return to the main 'menu', or 'exit'."
        subculture_menu
      end
  end
    
  def goodbye
    puts ""
    puts "Bye-BYEEEEE!!!"
  end
  
  #def list_shows_by_venue  -- not sure exactly how to use this yet
  #  puts "Please enter the name of an venue:"
  #  input = gets.strip
  #  if artist = Artist.find_by_name(input)
  #    artist.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, index|
  #    puts "#{index}. #{song.name} - #{song.genre.name}"
  #    end
  #  end
  #end 
  
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
