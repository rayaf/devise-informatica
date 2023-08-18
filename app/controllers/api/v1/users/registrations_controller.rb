# frozen_string_literal: true

# Controller responsável pelo registro de usuários na API V1.
class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  # Manipula a resposta após o registro do usuário.
  #
  # @param current_user [User] O usuário atual.
  # @param _opts [Hash] Opções adicionais (não utilizadas neste caso).

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: resource, status: 200
    else
      render json: { errors: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}, status: 401
    end
  end

  # Parâmetros permitidos para o registro de um usuário.
  #
  # @return [ActionController::Parameters] Os parâmetros permitidos.
  def sign_up_params
    params.require(:user).permit(:email, :password)
  end
end
