class Public::RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    relationship = Relationship.new
    relationship.follower_id = current_user.id
    relationship.followed_id = @user.id
    relationship.save
  end

  def destroy
    @user = User.find(params[:user_id])
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: @user.id)
    relationship.destroy
  end

end
