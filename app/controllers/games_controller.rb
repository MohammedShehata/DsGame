class GamesController < ApplicationController
  def idnex
    @games = Game.where("started = false and ended = false")
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end
end