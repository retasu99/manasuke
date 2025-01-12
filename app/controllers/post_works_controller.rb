class PostWorksController < ApplicationController

  def new
    @project_new = Project.find(params[:project_id])
    @post_work_new = PostWork.new
  end

  def index
  end

  def show
  end

end
