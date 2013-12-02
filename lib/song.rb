class Song
	attr_accessor :genre, :name
	def initialize 
		@genre
	end  

	def genre=(genre)
		@genre = genre
		genre.songs << self 
	end 
end 