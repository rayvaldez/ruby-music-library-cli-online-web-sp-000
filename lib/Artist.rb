require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist)
    artist = Artist.new(artist)
    @@all << artist
    artist
  end

  def songs
    @songs
  end

  def add_song(name)
    @songs << name unless @songs.include?(name)
    name.artist = self unless name.artist == self
  end

  def genres
    songs.collect(&:genre).uniq
  end
end
