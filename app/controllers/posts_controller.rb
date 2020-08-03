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
      flash[:success] = "Post successfully created"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def edit
  end

  def update
      if @post.update(post_params)
        flash[:success] = "Post was successfully updated"
        redirect_to @post
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to posts_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to posts_url
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
