class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
   
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment successfully created", status: :created }
        format.js 
      else
        format.html { redirect_to @post, notice: "Something went wrong" }
        format.js
        @errors = @comment.errors.full_messages
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to @post, notice: "Was deleted with success" }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, notice: "Something went wrong." }
        format.js
      end
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
