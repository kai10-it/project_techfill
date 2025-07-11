# CommentsControllerはコメントに関する操作（新しいコメントの作成）を扱うコントローラ
class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @comment = Comment.new(comment: params[:comment], article_id: params[:id], user_id: @current_user.id)
    @article = Article.find_by(id: params[:id])
    redirect_to("/articles/#{@article.id}/show") if @comment.save
  end
end
