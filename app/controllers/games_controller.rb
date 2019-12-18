class GamesController < ApplicationController
  before_action do
    login_required "editor"
  end
  def new
    @game = Game.new
  end
  def edit
    @game = Game.friendly.find(params[:id])
  end
  def update
    @game = Game.friendly.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect_to games_path, :notice => "game updated"
    else
      render "new"
    end
  end
  def index
    @games = Game.all
  end
  def show
    @game = Game.friendly.find(params[:id])
  end
  def create
    @game = Game.new(params[:game])
    if @game.save
      redirect_to games_path, :notice => "game created"
    else
      render "new"
    end
  end
  def destroy
    game = Game.friendly.find(params[:id])
    game.deep_delete if params[:deep] == "true"
    game.destroy if game
    redirect_to games_path, :notice => "game deleted"
  end
  def duplicate
    new_game = Game.friendly.find(params[:id]).duplicate
    redirect_to games_path, :notice => "duplicate game created"
  end
end
