class PostsController < ApplicationController
  before_action :find_posts, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save # if the post is saved successfully
      redirect_to posts_path # redirect to the show action
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  def destroy
    @post.destroy
    # redirect to the index action
    redirect_to posts_path
  end
  def show
  end
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
  def find_posts
    @post = Post.find(params[:id])
  end
end