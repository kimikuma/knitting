class RelationshipsController < ApplicationController

  def create
    @user=User.find(params[:user_id])
    current_user.follow(@user)
  end

  def destroy
    @user=User.find(params[:user_id])
    current_user.unfollow(@user)
  end

  def followings
    user=User.find(params[:user_id])
    @users=user.followings
  end

  def followers
    user=User.find(params[:user_id])
    @users=user.followers
  end

end
