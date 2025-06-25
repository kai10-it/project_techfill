class UsersController < ApplicationController
    before_action :ensure_correct_user, {only: [:edit, :update]}

    def new
        @user = User.new        
    end

    def create
        @user = User.new(name: params[:name], email: params[:email], password: params[:password], image_name: "default_user.jpg")
        if @user.save
            redirect_to("/")
        else
            render("users/new")
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
            redirect_to("/")
        else
            render("users/edit")
        end
    end

    def check        
    end

    def login
        @user = User.find_by(email: params[:email], password: params[:password])
        if @user
            session[:user_id] = @user.id
            redirect_to("/")
        else
            render("users/check")
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to("/")
    end

    def ensure_correct_user
        @user = User.find_by(id: params[:id])
        if @user.id != @current_user.id.to_s
            redirect_to("/")
        end
    end
end