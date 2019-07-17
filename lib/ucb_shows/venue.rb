class UCBShows::Venue 
  
  attr_accessor :name, :url
  
  @@all = []
  
  def initialize(name)
    @name = name
    @shows = []
  end

  def shows
    UCBShows::Scraper.scrape_index(self) if @shows.empty?
    @shows
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
  
  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end
  
end
