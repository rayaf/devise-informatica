# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: resource, status: 200
    else
      render json: { errors: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}, status: 401
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password)
  end
end
