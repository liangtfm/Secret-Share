class FriendshipsController < ApplicationController

  def new
  end

  def create
    @friendship = current_user.friendships.new({out_friend_id: params[:user_id]})

    if @friendship.save
      redirect_to :back
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to :back
    end
  end

end
