class UCBShows::Show 
  
  attr_accessor :name, :time, :description, :price, :status, :show_url
  attr_reader :venue
	
  @@all = []
  
  def initialize(show_hash, venue)
    show_hash.each  {|k, v| self.send(("#{k}="),v)}
    self.venue = venue
    venue.add_show(self)
    @@all << self
  end
  
  def self.new_from_hash(details_hash)
    venue = UCBShows::Venue.find_or_create_by_name(details_hash[:venue])
    show_hash = details_hash.select {|k,v| k != :venue}
	  self.new(show_hash, venue)
  end
  
  def self.all
    @@all
  end

end



# commenting these out, will not be needed once Venue is up and running	
 #def self.all_franklin
 #  @@all.select{|show| show.venue=="UCB Franklin"}
 #end 
 #
 #def self.all_sunset
 #  @@all.select{|show| show.venue=="UCB Sunset"}
 #end
 #
 #def self.all_hk
 #  @@all.select{|show| show.venue=="UCBT Hell's Kitchen"}
 #end

 #def self.all_subculture
 #  @@all.select{|show| show.venue=="UCB Subculture"}
 #end 

#@franklin_array.collect {|show| UCBShows::Show.new(show)} - this makes new shows!!!!
#UCBShows::Show.all.each_with_index.map{|show, index| puts "#{index+1}. #{show.name} - #{show.time}"} - this works!
