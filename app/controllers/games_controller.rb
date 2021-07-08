class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] || '').upcase
    @included = included?(@word, @letters)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
