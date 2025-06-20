class UsersController < ApplicationController
    def new        
    end

    def create
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
        @user.save
        redirect_to("/")
    end
end