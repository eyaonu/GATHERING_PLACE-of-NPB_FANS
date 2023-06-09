class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      #flash[:success] = "メールアドレスを更新しました"
      redirect_to admin_post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to admin_post_path(@post.id)
    else
      render :edit
    end
  end

  def page

  end

  private

  def post_params
    # params.require(:post).permit(:image, :name, :genre_id, :non_taxed_price, :sales_status, :description, :introduction)
  end
end