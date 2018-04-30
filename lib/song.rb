require 'pry'
require 'artist'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    split_data = file.split((" -")).map(&:strip)
    imported_song = Song.new(split_data[1])
    this_songs_artist = Artist.find_or_create_by_name(split_data[0])
    this_songs_artist.add_song(imported_song)
    imported_song
  end

end
