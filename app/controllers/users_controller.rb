class UsersController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user, {only: [:edit, :update]}

  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login, :check]}

  def new
    @user = User.new        
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], image_name: 'default_user.jpg')
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
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password = params[:password]

      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
          image = params[:image]
          File.binwrite("public/users_image/#{@user.image_name}", image.read)
      end
      
      if @user.save
        redirect_to('/')
      else
        render('users/edit')
      end
  end

  def login
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
      if @user.id != @current_user.id
        redirect_to('/')
      end
  end

  def forbid_login_user
    if @current_user
      redirect_to('/articles/index')
    end
  end
end