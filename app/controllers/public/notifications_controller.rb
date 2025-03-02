class Public::NotificationsController < ApplicationController #通知機能（自分がフォローされた時、自分の投稿にコメント・承認された時、
                                                                       #フォロワーが投稿した時、フォローしているユーザーが投稿した時）
  def index #自分への通知一覧
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def destroy #自分への通知を確認後、通知履歴を削除
    @notifications = current_user.notifications.destroy_all
    redirect_to notifications_path
  end
end
