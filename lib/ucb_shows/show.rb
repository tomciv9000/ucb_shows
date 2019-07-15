class UCBShows::Show 
  attr_accessor :name, :time, :description, :price, :status, :show_url

  @@all = []

  def initialize(venue_hash)
    venue_hash.each {|k, v| self.send(("#{k}="),v)}
    @@all << self
  end
  
  def self.all
    @@all
  end

end

#@franklin_array.collect {|show| UCBShows::Show.new(show)} - this makes new shows!!!!
#UCBShows::Show.all.each_with_index.map{|show, index| puts "#{index+1}. #{show.name} - #{show.time}"} - this works!