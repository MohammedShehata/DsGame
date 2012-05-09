class GamesController < ApplicationController
  def index
    @games = Game.where("started = false and ended = false")
  end
  def new
    @game = Game.new
    @game.started = false
    @game.ended = false
    @game.save  
  end
end