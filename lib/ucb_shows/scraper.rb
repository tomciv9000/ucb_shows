class UCBShows::Scraper

  def self.scrape_venues
    self.scrape_franklin_index
    self.scrape_sunset_index
    self.scrape_hk_index
    self.scrape_subculture_index
  end

  def self.scrape_franklin_index
    @franklin_array = []
     doc = Nokogiri::HTML(open("https://franklin.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: doc.css("div.col-xs-4 img.img-responsive").attribute("alt").text.gsub(/\smap/, ""),
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://franklin.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
     @franklin_array << hash
   end
   self.make_franklin_shows
  end

  def self.make_franklin_shows
   @franklin_array.collect {|show| UCBShows::Show.new(show)}
  end
  
def self.scrape_sunset_index
    @sunset_array = []
     doc = Nokogiri::HTML(open("https://sunset.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: doc.css("div.col-xs-4 img.img-responsive").attribute("alt").text.gsub(/\smap/, ""),
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://sunset.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
     @sunset_array << hash
   end
   self.make_sunset_shows
  end

  def self.make_sunset_shows
   @sunset_array.collect {|show| UCBShows::Show.new(show)}
  end  
  
  def self.scrape_hk_index
    @hk_array = []
     doc = Nokogiri::HTML(open("https://hellskitchen.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: doc.css("div.col-xs-4 img.img-responsive").attribute("alt").text.gsub(/\smap/, ""),
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://hellskitchen.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
     @hk_array << hash
   end
   self.make_hk_shows
  end

  def self.make_hk_shows
   @hk_array.collect {|show| UCBShows::Show.new(show)}
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
   self.make_subculture_shows
  end

  def self.make_subculture_shows
   @subculture_array.collect {|show| UCBShows::Show.new(show)}
  end
  
#  show titles - doc.css("div.col-xs-9 h4 a").collect {|x| x.text}
#=> ["The Great American Cabinet of Curiosities",
# "Shitty Jobs",
# "Queen George Slacks Off"]

#show_info = doc.css("div.col-xs-9")
#name = show_info.css("h4").text
#time = show_info.css("h5").text
#description = show_info.css("p").text
#price = show_info.css("a.btn strong").text
#status = show_info.css("a.btn").text.split(/\s*-\s*/)[1]
#show_url = "https://franklin.ucbtheatre.com/#{show_info.css("a").attribute("href").text}"
#=> "/performance/69511"

  
end