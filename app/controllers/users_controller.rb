class UsersController < ApplicationController
  
  protect_from_forgery :except => [:game_progress, :highscore, :game_data, :feedback]

  before_action :only=>['edit', 'update', 'delete', 'show', 'index'] do
    login_required "admin"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def show
    if params[:id] == "current"
      @user = User.find session[:user_id]
    else
      @user = User.friendly.find params[:id]
    end
    @worlds = World.all
  end

  def index
    @users = User.page params[:page]
  end
  
  def update
    @user = User.friendly.find params[:id]
    if @user.update_attributes(params[:user])
      redirect_to tiles_path, :notice => "user updated"
    else
      render "new"
    end
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.friendly.find params[:id]
  end

  def world_stats
    @user = User.find params[:user_id]
    @world = World.friendly.find params[:id]
    @success_percents = []
    @total_times = []
    @world.levels.each do |level|
      gd = GameData.where(:level_id => level.id, :user_id => @user.id)
      count = gd.count
      fail_count = gd.where(:status => 0).count
      success_count = gd.where(:status => 1).count
      @success_percents << ((fail_count + success_count) > 0 ? (100 * success_count) / (fail_count + success_count) : 0)
      @total_times << gd.sum(:time) / 1000
    end
    @level_count = @world.levels.count
  end

  def game_progress
    if session[:user_id] and params[:gameProgress] and session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
      @user.update_attribute :game_progress, params[:gameProgress]
      render :json => "ok"
    else
      render :json => "nok"
    end
  end

  def highscore
    if session[:user_id] and params[:gameProgress] and session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
      @user.update_attribute :highscore, params[:highscore]
      render :json => "ok"
    else
      render :json => "nok"
    end
  end

  def sync_game_progress
    if session[:user_id] and session[:user_id] == params[:id].to_i
      render :json => User.find(session[:user_id])
    else
      render :json => "nok"
    end
  end

  def game_data
    user_id = nil
    if session[:user_id]
      user_id = session[:user_id]
    elsif params[:id] != "null"
      user_id = params[:id]
    end
    if user_id
      User.find(session[:user_id]).update_attribute(:game_progress, params[:game_progress]) if params[:game_progress]
    end
    GameData.create(
      :level_id => params[:level_id],
      :user_id => user_id,
      :time => params[:time],
      :uuid => params[:uuid],
      :status => params[:status],
      :user_agent => request.env['HTTP_USER_AGENT'],
      :star_count => params[:star_count])
    render :json => "ok"
  end

  def feedback
    user_id = nil
    if session[:user_id]
      user_id = session[:user_id]
    elsif params[:id] != "null"
      user_id = params[:id]
    end
    Feedback.create(
      :content => params[:content],
      :user_agent => request.env['HTTP_USER_AGENT'],
      :user_id => user_id)
    render :json => "ok"
  end
end

