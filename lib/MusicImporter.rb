require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    mp3_array = []
    data_array = Dir.glob("#{@path}/*.mp3")
    data_array.each do |file|
      mp3_array << file.split("/").last
      end
    mp3_array
  end

  def import
    #imports the files into the library by invoking Song.create_from_filename
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
