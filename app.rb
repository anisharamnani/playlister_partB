require './parser' 
require 'ruby-debug'

class App

	attr_accessor :parser
	
	def initialize 
		@parser = Parser.new("data")
	end

	def welcome_message 
		puts "Hello! Welcome to the Player of Life!"
	end	

	def browse #by artist or genre 
		puts "What would you like to listen to? (Genre or Artist)"
		user_input = gets.chomp.upcase 
		unless user_input == "ARTIST" || user_input == "GENRE"
			puts "Sorry, I don't understand you. Please try again."
			user_input = gets.chomp.upcase
		end
		user_input 
	end

	def list_names user_input
		if user_input == "ARTIST"
			Artist::ARTISTS.each_with_index {|artist, i| puts "#{i+1}. #{artist.name}: #{artist.songs.size} Songs"}
		else 
			genre = Genre::GENRES.sort_by {|genre| genre.artists.size}
			genre.each_with_index {|genre, i| puts "#{i+1}. #{genre.name.capitalize}: #{genre.artists.size} Artists"}
		end  
	end

	####Dave Matthews Band - 2 Songs  
	#####1. Tripping Billies - Uncool Jam Bands  
	#####2. What Would You Say - Bands Blake Liked in 1996  

	def search_by_artist 
		puts "Which artist would you like to listen to?"
		user_input = gets.chomp
		searched = Artist::ARTISTS.detect{|artist| artist.name == user_input}
		while searched == nil
			puts "Sorry, I don't understand you. Please try again."
			user_input = gets.chomp
			searched = Artist::ARTISTS.detect{|artist| artist.name == user_input}
		end 
		searched
	end 

	def artist_details searched
		puts "#{searched.name}"
		searched.songs.each do |song|
			puts searched.song
		end 
	end  	
						

	def search_by_genre genre 
	end 

	def songs_page song
	end 								
end 

app = App.new 
app.welcome_message
user_input = app.browse
app.list_names(user_input)
searched = app.search_by_artist
app.artist_details(searched)


