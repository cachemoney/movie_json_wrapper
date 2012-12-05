require_relative "lib/movie"
require_relative "lib/api"

# def find_movie
#     puts "OH HAI. Search?"
#     movie_title = gets.chomp
#     movie = Api.search_by_title(movie_title)
#     if movie.nil?
#       puts "Try Again, #{movie_title} was not found"
#     else
#       puts "Found: #{movie.title}. Score: #{movie.score}"
#     end
# end

def movie_average(array)
  array.inject{ |sum, el| sum + el }.to_f / array.size
end

# Questions: #########################################
#
# Why wouldn't array.inject{ |sum, el| sum + el.score } not work, even when i passed in a movie struct
# 
# ####################################################

def find_movie
  movies_array = []
  movie_title = ''
  puts "Add a movie you really like, enter a 0 when done"
  movie_title = gets.chomp
    while movie_title != '0'
      
      if Api.search_by_title(movie_title).nil?
        puts "Try Again, #{movie_title} was not found"
      else
        movies_array << Api.search_by_title(movie_title).score
        #print "\t#{Api.search_by_title(movie_title).score}"
      end
      movie_title = gets.chomp
    end
    puts "The average score of your #{movies_array.size} movies is #{movie_average(movies_array)}" unless movies_array.size.zero?

end



find_movie

while true do
  puts "Get the average score of another set of movies? (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end

