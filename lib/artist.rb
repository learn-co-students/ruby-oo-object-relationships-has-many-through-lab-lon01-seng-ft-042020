class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end 

    # returns all songs associated with this Artist
    def songs
        Song.all.find_all {|song| song.artist == self}
    end 

    # creates a new song associated with that artist
    def new_song(name, genre) 
        Song.new(name, self, genre)
    end 

    # Artist has many genres, through songs
    def genres
        songs.map {|song| song.genre}
    end 

end