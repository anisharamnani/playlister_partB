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
			puts "Which artist would you like to listen to?"
			user_input = gets.chomp
			searched = Artist::ARTISTS.detect{|artist| artist.name == user_input}
			while searched == nil
				puts "Sorry, I don't understand you. Please try again."
				user_input = gets.chomp
				searched = Artist::ARTISTS.detect{|artist| artist.name == user_input}
			end
		else 
			genre = Genre::GENRES.sort_by {|genre| genre.artists.size}
			genre.each_with_index {|genre, i| puts "#{i+1}. #{genre.name.capitalize}: #{genre.artists.size} Artists"}
			
			puts "Which genre would you like to listen to?"
			user_input = gets.chomp.upcase

			searched = Genre::GENRES.detect{|genre| genre.name.upcase == user_input}
			while searched == nil 
				puts "Sorry, I don't understand you. Please try again."
				user_input = gets.chomp.upcase
				searched = Genre::GENRES.detect{|genre| genre.name.upcase == user_input}
			end  
		end 
		searched 
	end

	def song_selector 
		puts "Please select a song."
		song_name = gets.chomp.upcase
		searched = nil
		Artist::ARTISTS.each do |artist|
			searched = artist.songs.detect{|song| song.name.upcase == song_name} unless artist.songs.detect{|song| song.name.upcase == song_name}.nil?
			# searched is the song OBJECT whose @name matches song_name
		end 
		while searched == nil 
				puts "Sorry, I don't understand you. Please try again."
				song_name = gets.chomp.upcase
				Artist::ARTISTS.each do |artist|
					searched = artist.songs.detect{|song| song.name.upcase == song_name} unless artist.songs.detect{|song| song.name.upcase == song_name}.nil?
					# searched is the song OBJECT whose @name matches song_name
				end 
		end 
		searched
	end 

	def song_details searched
		Artist::ARTISTS.each do |artist|
			artist.songs.each do |song|
				# searched is a song object
				if song == searched 
					puts "Song: #{song.name}"
					puts "Artist: #{artist.name}"
					puts "Genre: #{song.genre.name.capitalize}"
				end 
			end 
		end 
	end 


	def artist_details searched
		puts "#{searched.name.capitalize}:"
		searched.songs.each_with_index{|song, i| puts "#{i+1} #{song.name}"}
	end

	def play
		welcome_message
		user_input = browse
		searched = list_names(user_input)
		artist_details(searched)
		searched = song_selector 
		song_details(searched)
	end 

end 

playlister = App.new
playlister.play

# app = App.new 
# app.welcome_message
# user_input = app.browse
# searched = app.list_names(user_input)
# app.artist_details(searched)
# searched = app.song_selector 
# app.song_details(searched)

=begin
1. break down code to run specs 
2. write specs 
3. refactor code to make it more awesome 
4. move on to the game of life. 
=end 

					 								

