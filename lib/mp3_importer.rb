require 'pry'

class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  # def files
  #   files=Dir.glob("#{self.path}/*mp3")
  #   changed_files = []
  #   files.map do |file|
  #     split_data = file.split((" -")).map(&:strip)
  #     wrong_name = split_data[0]
  #     wrong_genre = split_data[2]
  #     split_data[0] = wrong_name.sub("#{self.path}/","")
  #     split_data[2] = wrong_genre.sub(".mp3","")
  #     changed_files << split_data
  #   end
  #   changed_files
  # end

  def files
    files=Dir.glob("#{self.path}/*mp3")
    changed_files = []
    files.map do |file|
      changed_files << file.sub("#{self.path}/","")
    end
    #binding.pry
    @files = changed_files
  end

  def import
    self.files.each do |file|
      if file.end_with?(".mp3")
        imported_song = Song.new_by_filename(file)
        # split_data = file.split((" -")).map(&:strip)
        # imported_song = Song.new(split_data[1])
        # imported_song.artist = split_data[0]
        #binding.pry
        imported_song
      end
    end
  end

end
