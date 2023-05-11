class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save 
      redirect_to gossip_path(@comment.gossip_id), success: "Comment saved !"
    end
  else
    render :new
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :gossip_id)
  end
  
end
