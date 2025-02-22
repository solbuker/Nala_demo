# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = users(:user1)
        @user2 = users(:user2)
        sign_in @user
      end

      test 'should get index' do
        get api_v1_users_url, as: :json
        assert_response :success
      end

      test 'should show user' do
        get api_v1_user_url(@user2), as: :json
        assert_response :success
      end

      test 'should create user' do
        assert_difference('User.count') do
          post api_v1_users_url, params: { user: { name: 'New User', email: 'new@nalademo.com', leader_id: @user.id } }, as: :json
        end

        assert_response :created
      end

      test 'should update user' do
        patch api_v1_user_url(@user), params: { user: { name: 'Updated Name' } }, as: :json
        assert_response :success
      end

      test 'should destroy user' do
        assert_difference('User.count', -1) do
          delete api_v1_user_url(@user), as: :json
        end

        assert_response :no_content
      end
    end
  end
end
