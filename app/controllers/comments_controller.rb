class CommentsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user

  def index

  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content], author: current_user, gossip: Gossip.find(params[:gossip_id]))
  
    if @comment.save 
      redirect_to gossip_path(params[:gossip_id]), success: "Comment saved !"
    else
      @comment.errors.full_messages.each do |message|
        redirect_to gossip_path(params[:gossip_id]), danger: message
      end
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])

      unless @comment.author == current_user
        redirect_to gossip_path(params[:gossip_id]), danger: "You can't edit this comment !"
      end
  end

  def update
    @comment = Comment.find(params[:id])

    unless @comment.author == current_user
      redirect_to gossip_path(params[:gossip_id]), danger: "You can't edit this comment !"
    end

    if @comment.update(content: params[:content])
      redirect_to gossip_path(params[:gossip_id]), success: "Comment successfully updated !"
    else
      render :edit
    end

  end

  def destroy
    @comment = Comment.find(params[:id])

    unless @comment.author == current_user
      redirect_to gossip_path(params[:gossip_id]), danger: "You can't delete this comment !"
    end

    if @comment.destroy
      redirect_to gossip_path(params[:gossip_id]), success: "Comment successfully deleted !"
    else
      redirect_to gossip_path(params[:gossip_id]), danger: "Comment not deleted !"
    end
  end
  
end
