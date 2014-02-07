class FriendshipsController < ApplicationController

  def new
  end

  def create
    @friendship = current_user.friendships.new({out_friend_id: params[:user_id]})

    sleep(2)

    if @friendship.save
      redirect_to :back
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @friendship = Friendship.where("in_friend_id = ? AND out_friend_id = ?", current_user.id, params[:user_id])

    sleep(2)

    if @friendship.first.destroy
      head :ok
    end
  end

end
