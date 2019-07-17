class UCBShows::Scraper

  #def initialize
  #  @ucb_venues_array = Array.new
  #end
  
  def self.scrape_venues
    @ucb_venues_array = Array.new
    self.scrape_franklin_index
    self.scrape_sunset_index
    self.scrape_hk_index
    self.scrape_subculture_index
    self.make_shows
  end

  def self.scrape_franklin_index
    @franklin_array = []
     doc = Nokogiri::HTML(open("https://franklin.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: "UCB Franklin - LA",
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://franklin.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
       @franklin_array << hash
     end
     @ucb_venues_array << @franklin_array
  end
  
  def self.scrape_sunset_index
    @sunset_array = []
     doc = Nokogiri::HTML(open("https://sunset.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: "UCB Sunset - LA",
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://sunset.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
       @sunset_array << hash
     end
    @ucb_venues_array << @sunset_array
  end
  
  def self.scrape_hk_index
    @hk_array = []
     doc = Nokogiri::HTML(open("https://hellskitchen.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: "UCB Hell's Kitchen",
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://hellskitchen.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
     @hk_array << hash
    end
   @ucb_venues_array << @hk_array
  end

  def self.scrape_subculture_index
    @subculture_array = []
     doc = Nokogiri::HTML(open("https://subculture.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: "UCB at SubCulture",
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://subculture.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
     @subculture_array << hash
     end
   @ucb_venues_array << @subculture_array
  end
  
  def self.make_shows
    @ucb_venues_array.each do |venue|
      venue.collect {|show| UCBShows::Show.new_from_hash(show)}
    end
  end
  
end
