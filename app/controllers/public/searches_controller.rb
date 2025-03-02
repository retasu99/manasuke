class Public::SearchesController < ApplicationController #投稿・ユーザーの検索機能

  def search #検索項目と検索ワードを取り出す
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @post_works = PostWork.looks(params[:search], params[:word])
    end
  end
end
