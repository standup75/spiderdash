class WorldsController < ApplicationController
  before_action do
    login_required "editor"
  end
  def new
    @world = World.new
    @game_height = 320
    @game_width = 640
    @levels = []
  end
  def edit
    @world = World.friendly.find(params[:id])
    @game_height = @world.game ? @world.game.height : 320
    @game_width = @world.game ? @world.game.width : 640
    @levels = Level.where(:world_id => @world.id)
  end
  def update
    @world = World.friendly.find(params[:id])
    if @world.update_attributes(params[:world])
      set_checkpoints params[:checkpoints_json]
      redirect_to worlds_path, :notice => "world updated"
    else
      render "new"
    end
  end
  def index
    @worlds = World.all
  end
  def show
    @world = World.friendly.find(params[:id])
    @missingAssignments = @world.checkpoints.missing_assignments.map(&:cp_index).join(", ")
  end
  def create
    @world = World.new(params[:world])
    if @world.save
      @world.create_initial_chepoints
      set_checkpoints params[:checkpoints_json]
      redirect_to worlds_path, :notice => "world created"
    else
      render "new"
    end
  end
  def destroy
    world = World.friendly.find(params[:id])
    world.deep_delete if params[:deep] == "true"
    world.destroy if world
    redirect_to worlds_path, :notice => "world deleted"
  end
  def duplicate
    new_world = World.friendly.find(params[:id]).duplicate
    redirect_to worlds_path, :notice => "duplicate world created"
  end
  def stats
    @world = World.friendly.find params[:id]
    @success_percents = []
    @average_times = []
    @average_star_counts = []
    @world.levels.each do |level|
      gd = GameData.where(:level_id => level.id)
      count = gd.count
      fail_count = gd.where(:status => 0).count
      success_count = gd.where(:status => 1).count
      @success_percents << ((fail_count + success_count) > 0 ? (100 * success_count) / (fail_count + success_count) : 0)
      @average_times << (count == 0 ? 0 : gd.sum(:time) / (count * 1000))
      @average_star_counts << (success_count == 0 ? 0 : gd.where(:status => 1).sum(:star_count) / success_count)
    end
    @level_count = @world.levels.count
    @last_reached_count = [].fill 0, 0..@level_count-1
    @max_count = 1
    User.all.each do |user|
      if user.game_progress
        gp = ActiveSupport::JSON.decode user.game_progress
        # gp ex: {"score"=>5595, "lastCheckpoints"=>[4], "stars"=>[[nil, nil, 0, 0, 3]], "unlockWorlds"=>[], "mustaches"=>[]}
        if gp["stars"]
          world_stars = gp["stars"][@world.world_index]
          if world_stars
            @last_reached_count[world_stars.compact.length] += 1
            @max_count = @last_reached_count[world_stars.compact.length] if @max_count < @last_reached_count[world_stars.compact.length]
          end
        end
      end
    end
  end

  protected

  def set_checkpoints(checkpoints_json)
    checkpoints = ActiveSupport::JSON.decode(checkpoints_json)
    @world.set_checkpoints checkpoints
  end
end
