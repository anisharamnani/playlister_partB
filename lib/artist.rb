
class Artist 
	attr_accessor :name, :songs
	
	ARTISTS = []

	def initialize
		@name = name
		@songs = []
		ARTISTS << self 
	end 

	def self.count 
		ARTISTS.size
	end 

	def self.reset_artists
		ARTISTS.clear
	end

	def self.all 
		ARTISTS
	end  

	def add_song song 
		songs << song 
		song.genre.artists << self if song.genre && song.genre.artists.include?(self) == false
	end

	def songs_count 
		songs.size 
	end

	def genres 
		songs.map do |song|
			song.genre
		end 
	end 

end 

