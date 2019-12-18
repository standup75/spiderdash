class LevelsController < ApplicationController
  before_action do
    login_required "editor"
  end
  def new
    @level = Level.new
    @sprites = Sprite.all
  end
  def edit
    @level = Level.friendly.find(params[:id])
    @sprites = Sprite.all
  end
  def update
    begin
      @level = Level.friendly.find(params[:id])
    rescue
      @level = Level.new
    end
    if @level.update_attributes(params[:level])
      check_for_options
      redirect_to level_path(@level), :notice => "level updated"
    else
      render "new"
    end
  end
  def index
    @levels = Level.all
    @worlds = World.all
  end
  def show
    @level = Level.friendly.find(params[:id])
    @level.world ||= World.new
    @level.world.game ||= Game.new
    @level.world.game.sizing_mode ||= "strict"
    @level.world.game.width ||= 640
    @level.world.game.height ||= 320
  end
  def create
    @level = Level.new(params[:level])
    if @level.save
      check_for_options
      redirect_to level_path(@level), :notice => "level created"
    else
      render "new"
    end
  end
  def destroy
    level = Level.friendly.find(params[:id])
    level.deep_delete if params[:deep] == "true"
    level.destroy if level
    redirect_to levels_path, :notice => "level deleted"
  end
  def duplicate
    new_level = Level.friendly.find(params[:id]).duplicate
    redirect_to levels_path, :notice => "level duplicated"
  end

  protected

  def check_for_options
    Option.where(:level_id => @level.id).delete_all
    index = 0
    while option_label = params["label_#{index}".to_sym]
      option_content = params["content_#{index}".to_sym]
      sprite_id = params["sprite_#{index}".to_sym]
      Option.create :label => option_label, :content => option_content, :sprite_id => sprite_id, :level_id => @level.id
      index += 1
    end
  end
end
