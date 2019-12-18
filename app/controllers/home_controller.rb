class HomeController < ApplicationController
  #before_action do
  #  login_required "player"
  #end
  def index
    if params[:slug]
      @game = Game.find_by_slug(params[:slug])[0]
    else
      @game = Game.first
    end
    render :layout => "game"
  end
end
