require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabet = (?A..?Z).to_a

    @random_array = alphabet.sample(10)
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = open(url).read
    english_word = JSON.parse(word_serialized)
    if english_word['found'] == true
      @answer = "Congratulations! #{@word} is a valid English word!"
    end
  end
end
