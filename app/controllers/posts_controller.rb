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
    @posts=Post.all
  end

  private

  def post_params
    params.require(:post).permit(:caption,:image,:knittingname)
  end
end
