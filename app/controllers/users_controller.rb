# UsersController はユーザーに関する処理（アカウント編集や削除など）を扱うコントローラ
class UsersController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user, { only: %i[edit update] }

  before_action :ensure_correct_user, { only: %i[edit update] }
  before_action :forbid_login_user, { only: %i[new create login check] }

  def new
    @user = User.new
  end

  def create
    @user = build_user

    if @user.save
      redirect_to('/')
    else
      render('users/new')
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    assign_user_attributes(@user)
    user_save_image(@user, params[:image]) if params[:image]

    if @user.save
      redirect_to('/')
    else
      render('users/edit')
    end
  end

  def login
    # loginページへのルートを作成するためのアクション
  end

  def check
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to('/')
    else
      render('users/login')
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to('/')
  end

  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    redirect_to('/') unless @user.id == @current_user.id
  end

  def forbid_login_user
    redirect_to('/articles/index') if @current_user
  end

  private

  # ユーザーの新規作成ヘルパーメソッド
  def build_user
    User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: 'default_user.jpg'
    )
  end

  # ユーザー情報更新のヘルパーメソッド
  def assign_user_attributes(user)
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
  end

  # ユーザー情報更新のヘルパーメソッド
  # 画像を保存するためのメソッド
  def user_save_image(user, image_param)
    user.image_name = "#{user.id}.jpg"
    File.binwrite("public/users_image/#{user.image_name}", image_param.read)
  end
end
