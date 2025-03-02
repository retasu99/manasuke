class Public::AcknowledgementsController < ApplicationController #投稿への承認機能のコントローラ（一般的なSNSにおける、いいね機能）

  def create #特定の投稿への承認（いいね）
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:post_work_id])
    acknowledgement = Acknowledgement.new(post_work_id: @post_work.id)
    acknowledgement.user_id = current_user.id
    acknowledgement.save
  end

  def destroy #特定の投稿への承認解除（いいねをはずす）
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:post_work_id])
    acknowledgement = Acknowledgement.find_by(user_id: current_user.id, post_work_id: params[:post_work_id])
    acknowledgement.destroy
  end
  
end
