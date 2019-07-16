class UCBShows::Venue 

  attr_accessor :name, :shows
  
  @@all = []
  
  def initialize(name)
    @name = name
    @shows = []
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    venue = UCBShows::Venue.new(name)
    venue.save
    venue
  end

  
  def add_show(show)
    show.venue = self 
    @shows << show 
  end
  
  def shows 
    @shows
  end
  
  
  # - this is a findable / createable set of methods that might be helpful later but aren't needed now
  #def self.find_by_name(name)
  #  self.all.detect {|venue| venue.name == name}
  #end
#
  #def self.find_or_create_by_name(name)
  #  find_by_name(name) || self.create(name)
  #end
  
  
end