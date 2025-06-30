class ArticlesController < ApplicationController
    before_action :set_current_user
    before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
    
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    

    def index
        @articles = Article.all
    end
    
    def new
    end

    def create
        @article = Article.new(title: params[:title], body: params[:textarea], user_id: @current_user.id)

        if @article.save
            redirect_to("/")
        else
            render("articles/new")
        end
    end

    def show
        @article = Article.find_by(id: params[:id])
        @article_user = User.find_by(id: @article.user_id)
        @create_date = @article.created_at.strftime("%-Y-%-m-%-d")
        @comments = Comment.where(article_id: @article.id)
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
        redirect_to("/articles/index")
    end

    def ensure_correct_user
        @article = Article.find_by(id: params[:id])
        if @article.user_id != @current_user.id.to_s
            redirect_to("/articles/index")
        end
    end

    # 穴埋め問題機能用のアクション
    def fill_in_blank(text, mode)
        if mode == "blank"
            text.gsub(/\[\[(.*?)\]\]/) do
                "<span class=\"blank-mode\">#{$1}</span>"
            end.html_safe
        else
            text.gsub(/\[\[(.*?)\]\]/) do
                $1
            end
        end
    end    
end
