require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    self.songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(artist_name)
    result = self.all.detect { |artist| artist.name == artist_name }
    #binding.pry

    if result
      result
    else
      Artist.new(artist_name)
    end
  end

end
