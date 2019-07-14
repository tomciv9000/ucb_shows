class UCBShows::Scraper

  def get_franklin
    Nokogiri::HTML(open("https://franklin.ucbtheatre.com/"))
  end

  def scrape_franklin_index
     self.get_franklin.css("div#t1-50 li")
  end

  def make_shows
    scrape_franklin_index.each do |r|
      UCBShows::Shows.new_from_index_page(r)
    end
  end
end