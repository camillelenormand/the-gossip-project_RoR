class CommentsController < ApplicationController
  include SessionsHelper
  before_action :logged_in?
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
  
    if @comment.save 
      redirect_to gossip_path(@comment.gossip_id), success: "Comment saved !"
    else
      flash[:danger] = "Comment not saved !"
      render :new
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :gossip_id, :user_id)
  end
  
end
