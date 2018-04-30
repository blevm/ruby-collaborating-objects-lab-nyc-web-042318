require 'pry'
require 'song'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    if !Artist.all.include?(self)
      @@all << self
    end
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def print_songs
    songs.map do |song|
      #binding.pry
      puts song.name
    end
  end

  def self.find_or_create_by_name(artist_name)
    result = Artist.all.detect { |artist| artist.name == artist_name }

    if result
      result
    else
      new_artist = Artist.new(artist_name)
      new_artist.save
      new_artist
    end
  end

end
