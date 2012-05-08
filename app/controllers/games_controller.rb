class GamesController < ApplicationController
  def index
    @games = Game.where("started = false and ended = false")
  end
end