require 'pry'


class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(name = nil, artist_name = nil) # setting to nil, will keep it "empty"
    @name = name                                # So the rest of the program can access it 
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end
    
  def save                              # used in a later method
    self.class.all << self
  end
  
# Build a class constructor
#  Initializes a song and saves it to @@all
  def Song.create           # class constructor; using self vs Song will have it work with the instance itself 
    song = self.new         # declaring song to equal the new inputted song
    # @@all << song         # saving the song 
    return song             # returns the song
  end

# Build a class constructor
# Takes in a string name of a song
# Returns a song instance with that name set as its name property
  def Song.new_by_name(name) 
    song = self.new(name)
    song.save
    return song
  end

# Build a class constructor
# Takes in a string name of a song ad returns a song instance
# Song being saved into the @@all class variable 
 def Song.create_by_name(name) 
    song = self.new(name)     # decalring song as the new song inputted
    song.save                 # saving the song into the @@all class variable
    return song               # returns the song
  end

# Build a class finder
# Accepts the string name of a song and returns the matching instance of the song with that name
  def Song.find_by_name(name)               # Class finder
    @@all.find {|song| song.name == name}    # .find finds a specific instance of a song with the name we want
  end
  
# Prevent duplicate songs 
# Accept string name for a song, return a matching song instance with that name or create a new song with the name
# return the song instance
  def Song.find_or_create_by_name(name)   
    if self.find_by_name(name) == nil     # If the name of the song is equal to nil 
      self.create_by_name(name)           # then put the name of the song; goes through the create_by_name method, adding to @@all 
    else
      self.find_by_name(name)             # means that there is song with that title already and returns the matching song 
    end
  end
  
# Returns all the songs in ascending (a-z) alphabetical order
  def Song.alphabetical
    sort = self.all.uniq.sort_by {|song| song.name}   # sort_by compares the song inputted to the song.name value
                                                      # There were doubles so the .uniq is used
    sort
  end
  
# Build a Class constructor
# Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# Return a new Song instance with the song name set, artist_name set, remove mp3
  def Song.new_from_filename(name)
    
    new_name = self.name.split(" - ")
    artist_name = new_name[0]
    song_name = new_name[1]
    # binding.pry
    
    
  end
  
  
# Reset the state of the @@all class variable
  def Song.destroy_all
    self.all.clear
  end
  
  
end
