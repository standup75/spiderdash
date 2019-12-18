class SpritesController < ApplicationController
  before_action do
    login_required "editor"
  end
  def new
    @sprite = Sprite.new
  end
  def edit
    @sprite = Sprite.friendly.find(params[:id])
  end
  def update
    @sprite = Sprite.friendly.find(params[:id])
    if @sprite.update_attributes(params[:sprite])
      check_for_options
      redirect_to sprites_path, :notice => "sprite updated"
    else
      render "new"
    end
  end
  def index
    @sprites = Sprite.all
  end
  def show
    @sprite = Sprite.friendly.find(params[:id])
  end
  def create
    @sprite = Sprite.new(params[:sprite])
    if @sprite.save
      check_for_options
      redirect_to sprites_path, :notice => "sprite created"
    else
      render "new"
    end
  end
  def destroy
    sprite = Sprite.friendly.find(params[:id])
    sprite.deep_delete if params[:deep] == "true"
    sprite.destroy if sprite
    redirect_to sprites_path, :notice => "sprite deleted"
  end
  def duplicate
    new_sprite = Sprite.friendly.find(params[:id]).duplicate
    redirect_to sprites_path, :notice => "duplicate sprite created"
  end

  protected

  def check_for_options
    @sprite.options.delete_all
    index = 0
    while option_label = params["label_#{index}".to_sym]
      option_content = params["content_#{index}".to_sym]
      Option.create :label => option_label, :content => option_content, :sprite_id => @sprite.id
      index += 1
    end
  end
end
