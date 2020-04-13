class FriendshipsController < ApplicationController
    def create
        @user = User.find(params[:current_user])
        @user.friendships.build(friend_id: params[:friend])
        # @user = Friendship.create(user_id: params[:current_user], friend_id: params[:friend])
        if @user.save
            flash[:success] = "Successfully added as a friend"
        else
            flash[:danger] = "Something went wrong"
        end
        redirect_to my_friends_path    
    end    

    def destroy
        # @user = Friendship.where(user_id: current_user.id, friend_id: params[:id]).first
        @user = current_user.friendships.where(friend_id: params[:id]).first
        @user.destroy
        flash[:success] = "Successfully removed as a friend"
        redirect_to my_friends_path

    end    
end    