class UCBShows::Show 
  attr_accessor :name, :time, :description, :price, :availability
  
  
  def self.franklin
    #should return all the franklin shows 
    franklin_1 = self.new
    franklin_1.name = "Sentimental Lady: Guilty Pleasures"
    franklin_1.time = "7:00pm"
    franklin_1.description = "If you've got a guilty pleasure you can't wait to get off your chest, come see Sentimental Lady: Guilty Pleasures, where one audience member's guilty pleasure will be transformed from a skeleton in a closet into a fully improvised show!"
    franklin_1.price = "$9"
    franklin_1.availability = "Tickets Available at https://franklin.ucbtheatre.com/performance/68768#reservation"
    
    franklin_2 = self.new
    franklin_2.name = "ASSSSCAT"
    franklin_2.time = "8:00pm"
    franklin_2.description = "ASSSSCAT is the Upright Citizens Brigade's improv juggernaut that has played to critical acclaim and sold out audiences across the country."
    franklin_2.price = "$14"
    franklin_2.availability = "SOLD OUT"
    
    [franklin_1, franklin_2]
  end
  
  def self.sunset
  #
  end 
  
  def self.hells_kitchen
  #code here
  end
  
  def self.subculture
  #
  end 
  
  def self.all
    @@all
  end
  
end