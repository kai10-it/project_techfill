# ArticlesControllerは記事に関する操作（記事の一覧表示や作成、編集、削除）を扱うコントローラ
# また、記事の文章から穴埋め問題に使用する単語を抽出する処理も含まれる
class ArticlesController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user, { only: %i[new create edit update destroy] }
  before_action :ensure_correct_user, { only: %i[edit update destroy] }

  def index
    @articles = Article.all
  end

  def new
    # 新しい記事投稿フォームを表示する
  end

  def create
    @article = Article.new(title: params[:title], body: params[:textarea], user_id: @current_user.id)
    if @article.save
      redirect_to('/')
    else
      render('articles/new')
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
    @article_user = User.find_by(id: @article.user_id)
    @create_date = @article.created_at.strftime('%-Y-%-m-%-d')
    @comments = Comment.where(article_id: @article.id)
    # 穴埋め問題機能
    @mode = params[:mode]
    @article_body = fill_in_blank(@article.body, @mode)
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.title = params[:title]
    @article.body = params[:textarea]
    if @article.save
      redirect_to("/articles/#{@article.id}/show")
    else
      render("articles/#{@article.id}/show")
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect_to('/articles/index')
  end

  def ensure_correct_user
    @article = Article.find_by(id: params[:id])
    redirect_to('/articles/index') unless @article.user_id == @current_user.id.to_s
  end

  # 穴埋め問題機能用のアクション
  def fill_in_blank(text, mode)
    if mode == 'blank'
      text.gsub(/\[\[(.*?)\]\]/) do
        matched_word = Regexp.last_match(1)
        "<span class=\"blank-mode\">#{matched_word}</span>"
      end.html_safe
    else
      text.gsub(/\[\[(.*?)\]\]/) do
        Regexp.last_match(1)
      end
    end
  end
end
