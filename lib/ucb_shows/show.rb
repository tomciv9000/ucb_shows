class UCBShows::Show 
  attr_accessor :name, :time, :description, :price, :status, :show_url, :venue

  @@all = []

  def initialize(venue_hash)
    venue_hash.each do |k, v| 
      self.send(("#{k}="),v)
      UCBShows::Venue.find_or_create_by_name("#{self.venue}")
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  #def self.new_from_filename(filename)
	#  song_parts = filename.split(" - ")
	#  song_name = song_parts[1]
	#  artist = Artist.find_or_create_by_name(song_parts[0])
	#  genre = Genre.find_or_create_by_name(song_parts[2].split(".")[0])
	#  self.create(song_name, artist, genre)
  #end

end

#@franklin_array.collect {|show| UCBShows::Show.new(show)} - this makes new shows!!!!
#UCBShows::Show.all.each_with_index.map{|show, index| puts "#{index+1}. #{show.name} - #{show.time}"} - this works!