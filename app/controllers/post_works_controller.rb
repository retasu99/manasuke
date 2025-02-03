class PostWorksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @project = Project.find(params[:project_id])
    @post_work = PostWork.new
  end

  def create
    @post_work = PostWork.new(post_work_params)
    @project = Project.find(params[:project_id])
    @post_work.project_id = @project.id
    @post_work.user_id = current_user.id

    if @post_work.save
      redirect_to project_post_works_path
    else
      render :new
    end

  end

  def index
    @project = Project.find(params[:project_id])
  end

  def show
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:id])

    if @post_work.update(post_work_params)
      redirect_to project_post_works_path
    else
      render :edit
    end

  end

  def destroy
    post_work = PostWork.find(params[:id])
    post_work.destroy
    flash[:notice] = "Deleted your post successfully."
    redirect_to project_post_works_path
  end


  private

  def post_work_params 
    params.require(:post_work).permit(:name, :work, :area, :start_time, :end_time)
  end

  def is_matching_login_user
    @post_work = PostWork.find(params[:id])
    unless @post_work.user.id == current_user.id
      redirect_to project_post_works_path
    end
  end

end
