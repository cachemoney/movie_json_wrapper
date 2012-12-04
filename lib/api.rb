require "open-uri"
require "json"
require "ostruct"
require_relative "./movie"
class Api

	APIKEY = "ad7dvchc68qkrwyetu2h5rap"

	def self.search_by_title(title)
			url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{APIKEY}&q=#{URI.encode(title)}&page_limit=1"
			unless get_url_as_json(url).fetch("movies").empty?
				struct = OpenStruct.new(get_url_as_json(url).fetch("movies").first)
				Movie.new(id: struct.id.to_i,
									title: struct.title,
									year: struct.year,
									score: struct.ratings["critics_score"]
									)
			end
		# rescue Exception => e
		# 	puts e.message
	end

	def self.get_url_as_json(url)
		JSON.parse(open(url).read)
	end
end