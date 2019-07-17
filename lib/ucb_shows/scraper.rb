class UCBShows::Scraper

  def self.scrape_venue(venue)
    array_of_venue_show_details = []
    doc = Nokogiri::HTML(open(venue.url))
     doc.css("div.col-xs-9").collect do |show|
       hash = {
         venue: venue.name,
         name: show.css("h4").text,
         time: show.css("h5").text,
         description: show.css("p").text,
         price: show.css("a.btn strong").text,
         status: show.css("a.btn").text.split(/\s*-\s*/)[1],
         show_url: "#{venue.url}#{show.css("a").attribute("href").text}"
       }
       array_of_venue_show_details << hash
     end
    self.make_shows(array_of_venue_show_details)
  end
    
  def self.make_shows(show_details)
      show_details.collect {|show| UCBShows::Show.new_from_hash(show)}
  end  

  
end
