class Public::PostCommentsController < ApplicationController #特定の投稿へのコメント機能

  def create #特定の投稿へのコメントを作成
    post_comment = PostComment.new(post_comment_params)
    post_comment.user_id = current_user.id
      project = Project.find(params[:project_id])
      post_work = PostWork.find(params[:post_work_id])
    post_comment.post_work_id = post_work.id
    post_comment.save
      redirect_to project_post_work_path(project.id, post_work.id)
  end

  def destroy #自分が作成したコメントを削除
    PostComment.find(params[:id]).destroy
    redirect_to project_post_work_path(params[:project_id], params[:post_work_id])
  end


  private

  def post_comment_params #入力されたpost_commentテーブルのcommentカラムを要求
    params.require(:post_comment).permit(:comment)
  end

end
