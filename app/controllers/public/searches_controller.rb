class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @post_works = PostWork.looks(params[:search], params[:word])
    end
  end
end
