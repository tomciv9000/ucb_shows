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
    venue = self.new(name)
    venue.save
    venue
  end

  
  def add_show(show)
    show.venue = self
    shows << show 
  end
  
  def shows 
    @shows
  end
  
  def self.find_by_name(name)
    self.all.detect {|x| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
    
end