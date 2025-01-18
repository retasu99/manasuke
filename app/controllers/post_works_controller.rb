class PostWorksController < ApplicationController

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
    redirect_to project_post_works_path
  end


  private

  def post_work_params 
    params.require(:post_work).permit(:name, :work, :area, :start_at, :end_at)
  end

end
