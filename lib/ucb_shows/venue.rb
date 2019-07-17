class UCBShows::Venue 
  
  attr_accessor :name, :url
  
  @@all = []
  
  def initialize(name, url)
    @name = name
    @shows = []
    @url = url
    @@all << self
  end

  def shows
    UCBShows::Scraper.scrape_index(self) if @shows.empty?
    @shows
  end  
    
  def self.all
    @@all
  end
  
  #def save
  #  @@all << self
  #end
  
  #def self.create(name)
  #  venue = UCBShows::Venue.new(name)
  #  venue.save
  #  venue
  #end
#
  def add_show(show)
    show.venue = self 
    @shows << show 
  end
  
  def shows 
    @shows
  end
  
  def self.make_ucb_venues
    self.new("UCB Franklin - LA", "https://franklin.ucbtheatre.com")
    self.new("UCB Sunset - LA", "https://sunset.ucbtheatre.com")
    self.new("UCB Hell's Kitchen - NYC", "https://hellskitchen.ucbtheatre.com")
    self.new("UCB at SubCulture - NYC", "https://subculture.ucbtheatre.com")
  end
  #eventually shouldn't ever need to create a venue after scraping - just find_by_name
  
  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  #def self.find_or_create_by_name(name)
  #  find_by_name(name) || self.create(name)
  #end
  
end
