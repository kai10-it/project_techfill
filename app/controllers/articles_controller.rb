class ArticlesController < ApplicationController
    def index
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
    end
end
