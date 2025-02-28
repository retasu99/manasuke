class Public::AcknowledgementsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:post_work_id])
    acknowledgement = Acknowledgement.new(post_work_id: @post_work.id)
    acknowledgement.user_id = current_user.id
    acknowledgement.save
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:post_work_id])
    acknowledgement = Acknowledgement.find_by(user_id: current_user.id, post_work_id: params[:post_work_id])
    acknowledgement.destroy
  end
  
end
