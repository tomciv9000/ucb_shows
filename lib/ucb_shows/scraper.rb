class UCBShows::Scraper

  def self.get_franklin
    doc = Nokogiri::HTML(open("https://franklin.ucbtheatre.com/"))
    binding.pry
  end

  def scrape_franklin_index
     #self.get_franklin.css("div#t1-50 li")
  end

  def make_shows
    #scrape_franklin_index.each do |r|
      #UCBShows::Shows.new_from_index_page(r)
    #end
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

  
end