class UCBShows::CLI
  # add message to user
  def call
    UCBShows::Venue.make_ucb_venues
    start_menu
  end

  def start_menu
    puts ""
    puts "TONIGHT AT THE UPRIGHT CITIZENS BRIGADE".white.on_red.bold
    puts ""
    venues = UCBShows::Venue.all
    venues.each_with_index{|venue, i| puts "#{i+1}. #{venue.name}"}
    puts ""
    puts "Enter (1 - #{venues.length}) to view that venue's showtimes or 'exit' to exit:".light_red.bold
    input = gets.strip.downcase
    if input == "exit"
      goodbye
    elsif valid_choice?(input, venues.length)
      print_showtimes(input.to_i - 1)
    else
      puts ""
      puts "Let's try again. Enter (1 - #{venues.length}) for showtimes or 'exit'.".light_red.bold
      start_menu
    end
  end

  def print_showtimes(venue_index)
    venue = UCBShows::Venue.all[venue_index]
    if venue.shows.empty?
      puts "There are no shows at #{venue.name} tonight.".yellow.bold
      start_menu
    else
      puts ""
      puts "TONIGHT AT #{venue.name.upcase}".white.on_cyan.bold
      venue.shows.each_with_index do |show, index|
        puts "#{index+1}. #{show.time} - #{show.name}"
      end
      venue_menu(venue_index)
    end
  end

  def venue_menu(venue_index)
    venue = UCBShows::Venue.all[venue_index]
    puts ""
    puts "Enter (1 - #{venue.shows.length}) to view that show's details. 'menu' for main menu, or 'exit'.".light_red.bold
    show_input = gets.strip.downcase
    if show_input == "menu"
      start_menu
    elsif show_input == "exit"
      goodbye
    elsif valid_choice?(show_input, venue.shows.length)
      show_selection = venue.shows[show_input.to_i - 1]
      print_details(show_selection)
      puts ""
      puts "Would you like details for another show at #{venue.name}? 'Y' or 'N'?".light_red.bold
      input = gets.strip.downcase
      if input == "y"
        puts ""
        print_showtimes(venue_index)
      elsif input == "n"
        start_menu
      else
        puts ""
        puts "That was a yes or no question.  Let's try again.".light_red.bold
        print_showtimes(venue_index)
      end
    else
      puts ""
      puts "Let's try again. Enter (1 - #{venue.shows.length}), 'menu', or 'exit'.".light_red.bold
      print_showtimes(venue_index)
    end
  end

  def print_details(show)
    puts ""
    puts "#{show.name}".white.on_magenta.bold
    puts "Location:           #{show.venue.name}"
    puts "Time:               #{show.time}"
    puts "Price:              #{show.price}"
    puts "Status:             #{show.status}"
    puts "Website:            #{show.show_url}"
    puts ""
    puts "#{show.description}"
  end

  def valid_choice?(input, array_length)
    input.to_i > 0 && input.to_i <= array_length
  end


  def goodbye
    puts ""
    puts "We're done here.".light_red.bold
  end

end
