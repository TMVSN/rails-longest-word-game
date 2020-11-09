class GamesController < ApplicationController

  require "open-uri"

  def new
    @alpha =  ("a".."z").to_a
    @letters = 10.times.map { @alpha.sample }
  end

  def score
    @letters = params[:letters]
    @word = params[:user_input]
    @response = open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    @hash_response = JSON.parse(@response)
    @score = @hash_response["length"].to_i * 10

    if @hash_response["found"] == false
    @answer = "Sorry, #{@word} is not an english word !"
    # elsif @word.chars.any? { |char|@word.chars.count(char) > @new_grid.count(char.upcase) }
    # @answer = "ouf of scsdccsd"    
    else @answer = "congratulations ! Your word #{@word} brings you #{@score} points !"
    end
  end
end
