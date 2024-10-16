class PostsController < ApplicationController
  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    @post.save
    redirect_to post_path(@post)
  end


  def show
    @post=Post.find(params[:id])
    @user=@post.user

  end

  def index
    @posts=Post.page(params[:page]).order(created_at: :desc)
    @comment=Comment.new
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:caption,:image,:knittingname)
  end
end
