# frozen_string_literal: true

# app/users/sessions_controller.rb
module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      render json: resource
    end

    def respond_to_on_destroy
      render json: { message: 'Logged out.' }
    end
  end
end
