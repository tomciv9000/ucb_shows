class UCBShows::Show 
  attr_accessor :name, :time, :description, :price, :status, :show_url, :venue

  @@all = []
  
  def initialize(venue_hash)
    venue_hash.each  {|k, v| self.send(("#{k}="),v)}
    @@all << self
  end
  
  def self.all
    @@all
    
  end

  def self.all_franklin
    @@all.select{|show| show.venue=="UCB Franklin"}
  end 
  
  def self.all_sunset
    @@all.select{|show| show.venue=="UCB Sunset"}
  end
  
  def self.all_hk
    @@all.select{|show| show.venue=="UCBT Hell's Kitchen"}
  end

  def self.all_subculture
    @@all.select{|show| show.venue=="UCB Subculture"}
  end 
end

#@franklin_array.collect {|show| UCBShows::Show.new(show)} - this makes new shows!!!!
#UCBShows::Show.all.each_with_index.map{|show, index| puts "#{index+1}. #{show.name} - #{show.time}"} - this works!