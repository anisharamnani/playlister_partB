require './lib/artist'
require './lib/genre'
require './lib/song'
require 'awesome_print'
require 'ruby-debug'

class Parser

	attr_accessor :entries, :artists, :genres
	
	def initialize directory
		@entries = Dir.entries(directory).select {|f| !File.directory? f}
		@artists = []
		@genres = []
		parse
	end 

	def parse
		entries.each do |entry|
			entry = entry.gsub("].mp3", "")
			whole = entry.split(" - ")
			artist_name = whole[0]
			song_genre = whole[1].split(" [")
			song_name = song_genre[0]
			genre_name = song_genre[1]

			existing_artist = Artist.all.detect{|artist| artist.name == artist_name}

			artist = existing_artist || Artist.new.tap {|artist| artist.name = artist_name}

			song = Song.new 
			song.name = song_name 

			existing_genre = Genre.all.detect{|genre| genre.name == genre_name}
			genre = existing_genre || Genre.new.tap{|genre| genre.name = genre_name}

			song.genre = genre

			artist.add_song(song)

			artists << artist unless existing_artist
			genres << genre unless existing_genre
		end  
	end 


end 

# if existing_artist.nil? == false # if existing artist is NOT nil 
#  artist = existing_artist 
# else 
# 	artist = Artist.new
# 	artist.name = artist_name 
# end 

# debugger 
# puts "hello