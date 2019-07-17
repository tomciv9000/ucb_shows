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
    puts "Select a theater (1 - #{venues.length}) for listings or 'exit' to exit:"
    input = gets.strip.downcase
    if input.to_i <= (venues.length) && input.to_i != 0
      print_showtimes(input.to_i - 1)
    elsif input == "exit"
      goodbye  
    else
      puts ""
      puts "Let's try again. You can select a theater (1 - #{venues.length}) or type 'exit'."
      start
    end
  end
  
  def print_showtimes(venue_index)
    venue = UCBShows::Venue.all[venue_index]
    puts ""
    puts "TONIGHT AT #{venue.name.upcase}:"
    venue.shows.each_with_index do |show, index|
      puts "(#{index+1}) #{show.time} - #{show.name}"
    end
    venue_menu(venue_index)
  end
  
  def venue_menu(venue_index)
    venue = UCBShows::Venue.all[venue_index]
    puts ""
    puts "Select a show (1 - #{venue.shows.length}) for details, 'menu' for the main menu, or 'exit'."
    show_input = gets.strip.downcase
    if show_input == "menu"
      start
    elsif show_input == "exit"
      goodbye
    elsif show_input.to_i > 0 && show_input.to_i <= venue.shows.length
      show_selection = venue.shows[show_input.to_i - 1]
      print_details(show_selection)
      puts ""
      puts "Would you like to see details on another show at this venues? Enter Y or N"
      input = gets.strip.downcase
      if input == "y"
        puts ""
        print_showtimes(venue_index)
      elsif input == "n"
        list_theaters
      else
        puts ""
        puts "That was a yes or no question.  Let's try again."
        print_showtimes(venue_index)
      end
    else
      puts ""
      puts "Let's try again. You can select a show (1 - #{venue.shows.length}), 'menu', or 'exit'."
      print_showtimes(venue_index)
    end
  end
  
  
  def goodbye
    puts ""
    puts "We're done here."
  end
 
  

  def print_details(show)
    puts ""
    puts " #{show.name.upcase}"
    puts ""
    puts "Location:           #{show.venue.name}"
    puts "Time:               #{show.time}"
    puts "Price:              #{show.price}"
    puts "Status:             #{show.status}"
    puts "Website:            #{show.show_url}"
    puts ""
    puts "#{show.description}"
    puts ""
  end
  
end
