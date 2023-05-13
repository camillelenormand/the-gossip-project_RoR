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
    @comments = Comment.where(gossip_id: @gossip.id)
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

  def like 
    @gossip = find_gossip
    create_like
  end


  def unlike
    @gossip = find_gossip
    destroy_like
  end


  private

  def find_gossip
    Gossip.find(params[:id])
  end

  def create_like
    @like = @gossip.likes.build(user: current_user)
  
    if @like.save
      flash[:success] = "You liked this gossip!"
    else
      flash[:danger] = "You already liked this gossip!"
    end
  
    redirect_to gossip_path(@gossip)
  end

  def destroy_like
    @like = Like.where(user_id: current_user.id, likeable_id: @gossip.id)
  
    if @like.destroy_all
      flash[:success] = "You unliked this gossip!"
    else
      flash[:danger] = "You already unliked this gossip!"
    end

    redirect_to gossip_path(@gossip)
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end

end
