require 'pry'
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    split_data = file.split((" -")).map(&:strip)
    imported_song = Song.new(split_data[1])
    imported_song.artist = Song.artist_name=(split_data[0])
    #puts "#{imported_song.name} was imported"
    imported_song
    binding.pry
  end

  def self.artist_name=(name)
    created_artist = Artist.find_or_create_by_name(name)

    #artist.add_song("It's Real")
    #binding.pry
    if !Artist.all.include?(created_artist)
      created_artist.save
    end
    return created_artist
    #binding.pry
  end

  #binding.pry

end
