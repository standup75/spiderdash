class BonusController < ApplicationController
  before_action do
    login_required "editor"
  end
  def new
    @bonu = Bonu.new
  end
  def edit
    @bonu = Bonu.frendly.find(params[:id])
  end
  def update
    @bonu = Bonu.frendly.find(params[:id])
    if @bonu.update_attributes(params[:bonu])
      check_for_options
      redirect_to bonus_path, :notice => "bonus updated"
    else
      render "new"
    end
  end
  def index
    @bonus = Bonu.all
  end
  def show
    @bonu = Bonu.frendly.find(params[:id])
  end
  def create
    @bonu = Bonu.new(params[:bonu])
    if @bonu.save
      check_for_options
      redirect_to bonus_path, :notice => "bonus created"
    else
      render "new"
    end
  end
  def destroy
    bonu = Bonu.frendly.find(params[:id])
    bonu.deep_delete if params[:deep] == "true"
    bonu.destroy if bonu
    redirect_to bonus_path, :notice => "bonus deleted"
  end
  def duplicate
    new_bonu = Bonu.frendly.find(params[:id]).duplicate
    redirect_to bonus_path, :notice => "duplicate bonus created"
  end

  protected

  def check_for_options
    @bonu.options.delete_all
    index = 0
    while option_label = params["label_#{index}".to_sym]
      option_content = params["content_#{index}".to_sym]
      Option.create :label => option_label, :content => option_content, :bonu_id => @bonu.id
      index += 1
    end
  end
end
