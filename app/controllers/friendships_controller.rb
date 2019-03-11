class FriendshipsController < ApplicationController
  before_action :find_friend, except: %i[index update]
  before_action :find_friendship, only: %i[update]

  def index
    @pending_friendships = current_user.followers.pending
    @accepted_friendships = current_user.followers.active
    @pending_requests = current_user.friendships.pending
  end

  def create
    friendship = Friendship.new(user: current_user, friend: @friend)

    respond_to do |format|
      if ((current_user.id != @friend.id) && friendship.save)
        format.html { redirect_to @friend }
        format.js
      else
        format.html { redirect_to @friend, notice: 'Error with friend request' }
        format.js
      end
    end
  end

  def update
    if (params[:status] == '1') 
      @friendship.accepted!
    elsif (params[:status] == '0') 
      @friendship.rejected!
    end

    respond_to do |format|
      format.html { redirect_to friendships_path  }
      # format.js
    end
  end

  private

  def friendship_params
    require(:friendship).permit(:status)
  end

  def find_friend
    @friend = User.find(params[:friend_id])
  end

  def find_friendship
    @friendship = Friendship.find_by_id(params[:id])
  end
end
