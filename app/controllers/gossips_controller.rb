class GossipsController < ApplicationController
  include SessionsHelper
  include GossipsHelper
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @gossip = Gossip.all.order(created_at: :desc)
  end

  def show
    @gossip = Gossip.find(params[:id])
    @gossips = Gossip.all
    @comments = Comment.where(gossip_id: @id)
  end

  def new
    @gossip= Gossip.new
  end

  def create 
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id)
      
      if @gossip.save
        redirect_to gossips_path, success: "Gossip successfully created !"
      else
        @gossip.errors.full_messages.each do |message|
        redirect_to new_gossip_path, danger: message
      end
    end
  end

  def update
    @gossip = Gossip.find(params[:id])

    if current_user.id == @gossip.user_id && @gossip.update(title: params[:title], content: params[:content], user_id: current_user.id)
      redirect_to gossip_path(params[:id]), success: "Gossip successfully updated !"
    else
      render :edit
    end
  end

  def destroy 
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    
    if @gossip.destroy
      redirect_to gossips_path, success: "Gossip successfully deleted !"
    else
      redirect_to gossips_path, danger: "Gossip not deleted !"
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end

end
