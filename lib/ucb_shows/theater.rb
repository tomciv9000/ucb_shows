class UCBShows::Theater 
  
  #extend Concerns::Findable -this might be helpful later to search shows?

  attr_accessor :name, :shows, :address
  
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
    theater = self.new(name)
    theater.save
    theater
  end

  
  def add_show(show)
    show.theater = self
    shows << show 
  end
  
  def shows 
    @shows
  end
    
end