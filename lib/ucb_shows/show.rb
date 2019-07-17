class UCBShows::Show 
  
  attr_accessor :name, :time, :description, :price, :status, :show_url, :venue
	
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
