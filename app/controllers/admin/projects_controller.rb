class Admin::ProjectsController < ApplicationController
  layout 'admin'

  def index #プロジェクト一覧表示
    @projects = Project.all
    @new_project = Project.new
  end

  def create #プロジェクト新規作成
    @project = Project.new(project_params)
    @project.save
    redirect_to admin_projects_path
  end

  def destroy #プロジェクト削除
    project = Project.find(params[:id])
    project.destroy
    redirect_to admin_projects_path, notice: 'プロジェクトを削除しました。'
  end


  private

  def project_params #projectテーブルのnameカラムを要求
    params.require(:project).permit(:name)
  end
end
