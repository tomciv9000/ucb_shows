class UCBShows::Venue 
  
  #extend Concerns::Findable - maybe useful?

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
    show.venue = self unless show.venue
    shows << show unless shows.include?(show)
  end
  
  def shows 
    @shows
  end
  
  def find_by_name(name)
    self.all.detect {|venue| venue.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end
  
  
end