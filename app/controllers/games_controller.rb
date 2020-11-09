require 'open-uri'
require 'nokogiri'


class GamesController < ApplicationController
  def new
    @letters = []
    consonne = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Z']
    voyelle = ['A', 'E', 'I', 'O', 'U', 'Y']
    6.times do
      @letters << consonne.sample
    end
    4.times do
      @letters << voyelle.sample
    end
  end

  def score
    word = params[:word]
    url = 'https://wagon-dictionary.herokuapp.com/#{word}'
    result = open(url).read
    analysis = File.read(result)
    @score = JSON.parse(analysis)
  end
end
