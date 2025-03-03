class PostsController < ApplicationController
  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render "new"  
    end 
  end


  def show
    @post=Post.find(params[:id])
    @user=@post.user
  end

  def index
    @posts=Post.all.page(params[:page]).per(6).order(created_at: :desc)
    @comment=Comment.new
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :knittingname)
  end
end
