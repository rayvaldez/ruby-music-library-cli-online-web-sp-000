class Genre
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

  def self.create(genre)
    genre = Genre.new(genre)
    @@all << genre
    genre
  end

  def songs
    @songs
  end

  def artists
    songs.collect(&:artist).uniq
  end

end
