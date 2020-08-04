class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  before_action :set_post, only:[:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:comments).order("created_at DESC")
  end

  def new
    @post = Post.new
  end
  

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to @post, notice: "Created with success." }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, notice: "Something went wrong." }
        format.js
      end
    end
  end
  
  def edit
  end

  def update
      if @post.update(post_params)
        respond_to do |format|
          format.html { redirect_to @post, notice: "Updated with success." }
          format.js
        end
      else
        respond_to do |format|
          format.html { redirect_to @post, notice: "Something went wrong." }
          format.js
        end
      end
  end
  
  def destroy
    if @post.destroy
      respond_to do |format|
        format.html { redirect_to @post, notice: "Deleted with success." }
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
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
