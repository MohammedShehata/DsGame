class GamesController < ApplicationController
  def index
    @games = Game.where("started = false and ended = false")
    games_json = @games.map(&:fat7y)
    respond_to do |format|
      format.html
      format.json {render :json => games_json}
    end
  end
  def new
    @game = Game.new
    @game.user1 = User.first
    puts "#{@game.user1.id}"
    @game.started = false
    @game.ended = false
    @game.save
  end

  def show
    puts "showwwwwwwwwwwwwwwwwwwwwwwwwwwww"
  end
  
  def isstarted
    @game = Game.find params[:id]
    bool = @game.started
    respond_to do |format|
      format.json {render :json => bool}
    end
  end
end