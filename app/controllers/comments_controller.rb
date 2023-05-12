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
      redirect_to new_gossip_path, danger: message
      end
      redirect_to gossip_path(params[:gossip_id]), danger: "Comment not saved !"
    end
  end
  
end
