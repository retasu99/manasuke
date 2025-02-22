class Public::RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    relationship = Relationship.new
    relationship.follower_id = current_user.id
    relationship.followed_id = user.id
    relationship.save
    redirect_to user_path(user.id)
  end

  def destroy
    user = User.find(params[:user_id])
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    relationship.destroy
    redirect_to user_path(user.id)
  end

#  def following_users
#    @user = User.find(params[:user_id])
#  end

end
