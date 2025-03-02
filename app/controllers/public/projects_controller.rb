class Public::ProjectsController < ApplicationController #プロジェクト（投稿を子としてネストされている）機能
  
  def index #プロジェクト一覧ページを表示
    @projects = Project.all
  end

end
