require './parser'

describe Parser, "#get_artist" do 
	it "should return the name of the artist" do 
		song_entry = "Adele - Someone Like You [country].mp3"
		parser = Parser.new("data")
		expect(parser.get_artist(song_entry)).to eq("Adele")
	end 
end 

describe Parser, "#get_song" do 
	it "should return the name of the song" do 
		song_entry = "Adele - Someone Like You [country].mp3"
		parser = Parser.new("data")
		expect(parser.get_song(song_entry)).to eq("Someone Like You")
	end 
end 

describe Parser, "#get_genre" do 
	it "should return the genre of the song" do 
		song_entry = "Adele - Someone Like You [country].mp3"
		parser = Parser.new("data")
		expect(parser.get_song(song_entry)).to eq("Someone Like You")
	end 
end 