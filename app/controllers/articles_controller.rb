class ArticlesController < ApplicationController
    # ログインしていない時は記事を投稿できないようにする
    before_action :authenticate_user!, except: [:index, :show]

    # 新しく投稿された順番で記事の一覧を表示する
    def index
        # キーワードが入力されている場合は、タイトルまたは本文にキーワードを含む記事を検索する
        if params[:query].present?
            @articles = Article.where("title LIKE :search OR body LIKE :search", search: "%#{params[:query]}%").order(created_at: :desc)
        # キーワードが入力されていない場合は、すべての記事を表示する
        else
            @articles = Article.all.order(created_at: :desc)
        end
    end

    # 記事の内容を閲覧する
    def show
        @article = Article.find(params[:id])
    end

    # ログイン中のユーザーが新しい記事を作成するための準備をする
    def new
        @article = current_user.articles.build
    end

    # フォームから送信された記事を保存し、保存後の処理を行う
    def create
        @article = current_user.articles.build(article_params)
        # 記事の保存に成功したら、その記事のページに移動しメッセージを表示する
        if @article.save
            redirect_to @article, notice: "記事を投稿しました"
        # 投稿失敗時にもう一度投稿フォームを表示する
        else
            render :new, status: :unprocessable_entity
        end
    end

    # 投稿した記事を編集する
    def edit
        @article = Article.find(params[:id])
    end
    
    # 編集した記事の内容を保存する
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article, notice: "記事を更新しました"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # 投稿した記事を削除する
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path, notice: "記事を削除しました"
    end

    # ここからはcontroller内だけで使う処理
    private
    
    # 記事のタイトルと記事の内容のデータだけを受け取る処理
    def article_params
        params.require(:article).permit(:title, :body)
    end
end
