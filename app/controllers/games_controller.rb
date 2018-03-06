require 'open-uri'

class GamesController < ApplicationController
  def new
    @new = []
    10.times do |x|
      @new << ("A".."Z").to_a[rand(25)]
    end
    return @new
  end

  def score
    @result = { score: 0 }
    @solution = params[:name]
    word_test = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@solution}").read)
    if @solution.upcase.split("").all? { |letter| @solution.upcase.split("").count(letter) <= params[:toto].count(letter) }
      if word_test["found"]
        @result = "Well done!, the word #{@solution} is correct."
      else
        @result = "Error: the word #{@solution} is not an English word."
      end
    else
      @result = "Error: the word #{@solution} is not in the grid."
    end
    return @result
  end

end
