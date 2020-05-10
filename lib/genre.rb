class Genre

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end 

    def songs
        Song.all.find_all {|song| song.genre == self}
    end 

    # has many artists, through songs
    def artists
        songs.map {|song| song.artist}
    end 

end