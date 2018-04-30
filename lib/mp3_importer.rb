require 'pry'
require 'song'
require 'artist'

class MP3Importer

  attr_accessor :path, :files

  @@all = []

  def initialize(path)
    @path = path
    @files = []
    @@all << self
  end

  def self.all
    @@all
  end

  def files
    files=Dir.glob("#{self.path}/*mp3")
    changed_files = []
    files.map do |file|
      changed_files << file.sub("#{self.path}/","")
    end
    changed_files
  end

  def import
    files.each do |file|
      if file.end_with?(".mp3")
        Song.new_by_filename(file)
      end
    end
  end

end
