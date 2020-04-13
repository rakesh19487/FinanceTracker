class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @user_stocks = @user.stocks
    end    

    def my_friends
        @friendships = current_user.friends
    end   
    
    def search_friends
        if params[:search_params].blank?
            flash[:danger] = "You have entered an empty string"
        else
            @users_list = User.search(params[:search_params])
            @users = current_user.except_current_user(@users_list)
            flash[:danger] = "No users match this search" if @users.blank?
        end    
        respond_to do |format|
            format.js {render partial: "friends/result"}
        end    
    end    

    def show
        @user = User.find(params[:id])
        @user_stocks = @user.stocks
    end    
end   