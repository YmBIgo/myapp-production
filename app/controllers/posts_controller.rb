class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    redirect_to root_path
    flash[:alert] = "新しい投稿はできません"
     # @post = Post.create(params.require(:post).permit(:content, :place, :user_id).merge(:user_id => current_user.id))
     # @user = User.find(@post.user_id)
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      flash[:notice] = "データの変更はできません"
    else
      redirect_to "/posts"
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.user_id == current_user.id
      # @post.update(params.require(:post).permit(:content, :place))
    else
      redirect_to "/posts"
      flash[:alert] = "無効なユーザー"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.user_id == current_user.id
      # @post.destroy
      flash[:notice] = "データの削除はできません"
    else
      redirect_to "/posts"
      flash[:alert] = "無効なユーザー"
    end
  end

end
