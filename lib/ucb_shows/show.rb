class UCBShows::Show 
  attr_accessor :name, :time, :description, :price, :status, :show_url

  @@all = []

  def initialize(venue_hash)
    venue_hash.each {|k, v| self.send(("#{k}="),v)}
    @@all << self
  end
  
  def self.all
    @@all
  end

end