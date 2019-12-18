class CheckpointsController < ApplicationController
  before_action do
    login_required "editor"
  end
  respond_to :json
  def update
    @checkpoint = Checkpoint.friendly.find(params[:id])
    @checkpoint.update_attributes(params[:checkpoint])
    respond_with @checkpoint
  end
  def create
    @checkpoint = Checkpoint.new(params[:checkpoint])
    @checkpoint.save
    respond_with @checkpoint
  end
  def destroy
    checkpoint = Checkpoint.friendly.find(params[:id])
    reindex checkpoint.cp_index, checkpoint.world_id
    checkpoint.deep_delete if params[:deep] == "true"
    checkpoint.destroy if checkpoint
    respond_with @checkpoint
  end

  private

  def reindex(index, world_id)
    Checkpoint.where("world_id=? AND cp_index>?", world_id, index).each do |cp|
      cp.update_attribute :cp_index, cp.cp_index-1
    end
  end
end
