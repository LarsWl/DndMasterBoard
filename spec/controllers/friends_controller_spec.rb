# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe FriendsController do
  context 'user logged in' do
    before :all do
      @users = FactoryBot.create_list(:user, 10)
      @user = user_with_friend_requests(request_count: 10)
    end

    before :each do
      sign_in @user
      @friend_id = @users.detect { |u| !Friendship.where(user_id: @user.id).pluck(:friend_id).include? u.id }.id
    end

    describe '#index' do
      it 'success' do
        get :index

        expect(response).to have_http_status(:success)
      end
    end

    describe '#suggestions' do
      it 'success' do
        get :suggestions, params: { search_nick: 'nick' }

        expect(response).to have_http_status(:success)
      end

      it 'render search results' do
        get :suggestions, params: { search_nick: @users.first.nickname }

        expect(response).to render_template "friends/_search_results"
      end
    end

    describe '#create' do
      it 'success' do
        post :create, params: { friend_id: @friend_id }

        expect(response).to have_http_status(:success)
      end

      it 'render possible friend template' do
        post :create, params: { friend_id: @friend_id }

        expect(response).to render_template 'friends/_possible_friend'
      end

      it 'create friendship request from signed user' do
        friendships_count = @user.friendships.count

        post :create, params: { friend_id: @friend_id }

        expect(@user.friendships.count).to eq friendships_count + 1
      end

    end

    describe '#accept_request' do
      before :each do
        @new_friend_id =  @user.friendship_requests.first.user_id
      end

      it 'success' do
        patch :accept_request, params: { id: @new_friend_id }

        expect(response).to have_http_status(:success)
      end

      it 'approve friend request' do
        patch :accept_request, params: { id: @new_friend_id }

        accepted_friendship = Friendship.find_by(user_id: @new_friend_id,
                                                 friend_id: @user.id)

        expect(accepted_friendship.approved).to eq true
      end

      it 'create and approve reverse friendship' do
        patch :accept_request, params: { id: @new_friend_id }

        accepted_friendship = Friendship.find_by(user_id: @user.id,
                                                 friend_id: @new_friend_id)

        expect(accepted_friendship.approved).to eq true
      end
    end

    describe '#decline_request' do
      before :each do
        @declined_friend_id = @user.friendship_requests.first.user.id
      end

      it 'success' do
        delete :decline_request, params: { id: @declined_friend_id }

        expect(response).to have_http_status(:success)
      end

      it 'destroy friendship request' do
        friendships_count = @user.friendship_requests.count

        delete :decline_request, params: { id: @declined_friend_id }

        expect(@user.friendship_requests.count).to eq friendships_count - 1
      end
    end
  end
end
