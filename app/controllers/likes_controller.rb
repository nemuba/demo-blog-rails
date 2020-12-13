class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.new(post_id: @post.id, user_id: current_user.id)
    respond_to do |format|
      if @like.save
        format.html { redirect_to @post, notice: "like successfully created", status: :created }
        format.js
      else
        format.html { redirect_to @post, notice: "Something went wrong" }
        format.js
        @errors = @like.errors.full_messages
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
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

  def like_params
    params.require(:like).permit(:post_id)
  end
end
