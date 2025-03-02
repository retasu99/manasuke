class Public::PostWorksController < ApplicationController #投稿機能
  before_action :is_matching_login_user, only: [:edit, :update] #edit・updateアクション実行前に、投稿者とログイン中のユーザーが同じか判断

  def new #新規投稿ページを表示
    @project = Project.find(params[:project_id])
    @post_work = PostWork.new
  end

  def create #新規投稿
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

  def index #投稿一覧ページを表示
    @project = Project.find(params[:project_id])
  end

  def show #投稿の詳細ページを表示
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit #投稿の編集ページを表示
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:id])
  end

  def update #編集した投稿データを保存
    @project = Project.find(params[:project_id])
    @post_work = PostWork.find(params[:id])
    if @post_work.update(post_work_params)
      redirect_to project_post_work_path(@project.id, @post_work.id)
    else
      render :edit
    end
  end

  def destroy #投稿を削除
    post_work = PostWork.find(params[:id])
    post_work.destroy
    flash[:notice] = "削除しました."
    redirect_to project_post_works_path
  end


  private

  def post_work_params #入力された、投稿に必要な5つのカラムを要求
    params.require(:post_work).permit(:name, :work, :area, :start_time, :end_time)
  end

  def is_matching_login_user #ログイン中のユーザーと投稿者が等しいか判断、もし異なれば投稿詳細ページへ遷移
    @post_work = PostWork.find(params[:id])
    unless @post_work.user.id == current_user.id
      redirect_to project_post_works_path
    end
  end

end
