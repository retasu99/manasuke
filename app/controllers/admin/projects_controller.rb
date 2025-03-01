class Admin::ProjectsController < ApplicationController
  layout 'admin'

  def index
    @projects = Project.all
    @new_project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to admin_projects_path
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to admin_projects_path, notice: 'プロジェクトを削除しました。'
  end


  private

  def project_params
    params.require(:project).permit(:name)
  end
end
