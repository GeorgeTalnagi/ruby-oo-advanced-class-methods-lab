require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
 #<Song:0x00007fffd5a6e000 @name="Thriller">,
 #<Song:0x00007fffd5a6df88 @name="Blank Space">,
 #<Song:0x00007fffd5a6df10 @name="Call Me Maybe">]

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
    song = self.new 
    self.all << song
    song 
  end 

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end 

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
    end 

  def self.find_by_name(title)
    @@all.find {|x| x.name == title}
  end 

  def self.find_or_create_by_name(title)
    find_by = self.find_by_name(title)
    if find_by 
        find_by
    else 
      self.create_by_name(title)
    end 
  end 

  def self.alphabetical
    @@all.sort_by { |word| word.name}
   end 

  def self.new_from_filename(filename)
    new_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = new_filename[1]
    song.artist_name = new_filename[0]
    song 
  end 

  def self.create_from_filename(filename)
    new_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = new_filename[1]
    song.artist_name = new_filename[0]
    song.save
    song 
  end 

  def self.destroy_all
    @@all.clear 
  end 
end
