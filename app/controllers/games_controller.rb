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
    @game.board = Board.new
    @game.board.game = @game
    @game.user1 = User.first
    @game.turn = @game.user1
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

  def turn
    @game = Game.find params[:game]
    turn = @game.turn 
    bool = (turn.id == params[:user].to_i)
    respond_to do |format|
      format.json {render :json => bool}
    end
  end
  
  def changes
    @board = Board.where("game_id = #{params[:game]}")[0]
    a = []
    a.push(@board.ele1)
    a.push(@board.ele2)
    a.push(@board.ele3)
    a.push(@board.ele4)
    a.push(@board.ele5)
    a.push(@board.ele6)
    a.push(@board.ele7)
    a.push(@board.ele8)
    a.push(@board.ele9)
    respond_to do |format|
      format.json {render :json => a}
    end
  end
  
  def play
    @game = Game.find params[:game]
    if(@game.turn == @game.user1)
      @game.update_attributes :turn => @game.user2
    else
      @game.update_attributes :turn => @game.user1
    end
    @board = Board.where("game_id = #{params[:game]}")[0]
    bool = @board.update_attributes "ele" + params[:index] => params[:data]
    respond_to do |format|
      format.json {render :json => bool}
    end
  end 
  
  def join
    @game = Game.find params[:id]
    #redirect_to "join"  
  end
   
end