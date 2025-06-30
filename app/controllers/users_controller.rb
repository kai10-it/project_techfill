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
end