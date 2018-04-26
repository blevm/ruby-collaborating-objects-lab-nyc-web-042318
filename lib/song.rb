require 'pry'
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    split_data = file.split((" -")).map(&:strip)
    imported_song = Song.new(split_data[1])
    Song.artist_name=(split_data[0])
    #binding.pry
    puts "#{imported_song.name} was imported"
    imported_song
  end

  def self.artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song("It's Real")
    artist.save
  end

end
