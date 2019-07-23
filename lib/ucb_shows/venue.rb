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
    UCBShows::Scraper.scrape_venue(self) if @shows.empty?
    @shows
  end

  def self.all
    @@all
  end

  def add_show(show)
    @shows << show 
  end

  def self.make_ucb_venues
    self.new("UCB Franklin - LA", "https://franklin.ucbtheatre.com")
    self.new("UCB Sunset - LA", "https://sunset.ucbtheatre.com")
    self.new("UCB Hell's Kitchen - NYC", "https://hellskitchen.ucbtheatre.com")
    self.new("UCB at SubCulture - NYC", "https://subculture.ucbtheatre.com")
  end

  def self.find_by_name(name)
    self.all.detect {|x| x.name == name}
  end


end
