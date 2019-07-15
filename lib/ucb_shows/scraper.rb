class UCBShows::Scraper

  def self.scrape_franklin_index
     doc = Nokogiri::HTML(open("https://franklin.ucbtheatre.com/"))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "https://franklin.ucbtheatre.com/#{show.css("a").attribute("href").text}"
       }
     @franklin_hash = hash
   end
   binding.pry
   @franklin_hash
  end

  def self.make_franklin_shows
      UCBShows::Show.new(@franklin_hash)
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