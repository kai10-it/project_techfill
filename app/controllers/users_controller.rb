class UsersController < ApplicationController
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
            @user.image_name = "#{@user.id}.png"
            image = params[:image]
            File.binwrite("public/users_image/#{@user.image_name}", image.read)
        end
        
        if @user.save
            redirect_to("/")
        else
            render("users/edit")
        end
    end
end