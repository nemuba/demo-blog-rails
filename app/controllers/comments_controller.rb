class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment successfully created"
      redirect_to @post
    else
      flash[:error] = "Something went wrong"
      redirect_to @post
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
  def comment_params
    params.require(:comment).permit(:description, :post_id, :user_id)
  end
  
end
