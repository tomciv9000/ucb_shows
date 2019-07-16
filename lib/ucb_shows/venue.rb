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
  
  
end
