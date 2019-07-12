# My CLI Controller

class UCBShows::CLI
  
  def call
    puts "Tonight at the Upright Citizens Brigade Theaters:"
    list_theaters
  end
  
  def list_theaters
    puts <<-DOC
      1. UCB LA - Franklin Theater
      2. UCB LA - Sunset Theater
      3. UCB NY - Hell's Kitchen
      4. UCB NY - at SubCulture
    DOC
  end
  
end