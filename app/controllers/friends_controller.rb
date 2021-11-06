class FriendsController < ApplicationController
  before_action :set_friend, only: %i[create]
  def index
    @friends = current_user.friends.decorate
  end

  def suggestions
    @possible_friends = current_user.search_possible_friends(params[:search_nick]).decorate

    respond_to do |format|
      format.html { render partial: 'friends/search_results', locals: { possible_friends: @possible_friends} }
    end
  end

  def create
    friendship = Friendship.create(user_id: current_user.id, friend_id: @friend.id)

    render partial: 'possible_friend', locals: { possible_friend: @friend }
  end

  def accept_request
    @friend = User.find(params[:id])

    friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    reverse_friendship = Friendship.find_or_create_by(user_id: current_user.id, friend_id: params[:id])

    friendship.update(approved: true)
    reverse_friendship.update(approved: true)

    respond_to do |format|
      format.turbo_stream
    end
  end

  def decline_request
    @friend = User.find(params[:id])

    Friendship.find_by(user_id: params[:id], friend_id: current_user.id).destroy
  end

  private

  def set_friend
    @friend = User.find(params[:friend_id].to_i)
  end
end
