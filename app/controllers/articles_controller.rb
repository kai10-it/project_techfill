class ArticlesController < ApplicationController
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
    end
end
