class Public::RelationshipsController < ApplicationController #フォロー機能

  def create #特定のユーザーをフォローする
    @user = User.find(params[:user_id])
    relationship = Relationship.new
    relationship.follower_id = current_user.id
    relationship.followed_id = @user.id
    relationship.save
  end

  def destroy #特定のユーザーへのフォローを解除
    @user = User.find(params[:user_id])
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: @user.id)
    relationship.destroy
  end

end
