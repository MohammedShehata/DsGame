class GamesController < ApplicationController
  def index
    @games = Game.where("started = false and ended = false")
    @watch = Game.where("started = true and ended = false")
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
    @game.user1 = session[:user]
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
      if(!bool)
        format.json {render :json => [bool]}
      else
        format.json {render :json => [bool, @game.user2.name]}
      end
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
    check_var = check(@board) 
    a.push(check_var)
    if(check_var != "Cont")
      @board.game.ended = true
    end
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
    @board.update_attributes "ele" + params[:index] => params[:data]
    check_var = check @board
    if(check_var != "Cont")
      @board.game.ended = true
    end
    respond_to do |format|
      format.json {render :json => check_var}
    end
  end 
  
  def join
    @game = Game.find params[:id]
    @game.update_attributes :user2 => session[:user]
    @game.update_attributes :started =>true
    #redirect_to "join"  
  end
   
  def check board
    check = ""
    if(board.ele1 == board.ele2 && board.ele2 == board.ele3 && board.ele1 != nil)
      if(board.ele1 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end
    elsif(board.ele4 == board.ele5 && board.ele5 == board.ele6  && board.ele4 != nil)
      if(board.ele4 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end
    elsif(board.ele7 == board.ele8 && board.ele8 == board.ele9  && board.ele7 != nil)
      if(board.ele7 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end   
    elsif(board.ele1 == board.ele4 && board.ele4 == board.ele7  && board.ele1 != nil)
      if(board.ele1 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end   
    elsif(board.ele2 == board.ele5 && board.ele5 == board.ele8  && board.ele2 != nil)
      if(board.ele2 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end
    elsif(board.ele3 == board.ele6 && board.ele6 == board.ele9  && board.ele3 != nil)
      if(board.ele3 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end
    elsif(board.ele1 == board.ele5 && board.ele5 == board.ele9  && board.ele1 != nil)
      if(board.ele1 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end   
    elsif(board.ele3 == board.ele5 && board.ele5 == board.ele7  && board.ele3 != nil)
      if(board.ele3 == "X")
        check = "X_Win"
      else
        check = "O_Win"
      end
    elsif(board.ele1 == nil || board.ele2 == nil  || board.ele3 == nil ||
      board.ele4 == nil || board.ele5 == nil  || board.ele6 == nil ||
      board.ele7 == nil || board.ele8 == nil  || board.ele9 == nil)
        check = "Cont"
    else
        check = "Draw"
    end
    return check
  end
  
  # -----------------------------------------------------------------------------
  
  def watch
    @game = Game.find params[:id]
  end 
end