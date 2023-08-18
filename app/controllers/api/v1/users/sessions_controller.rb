# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  # Cria uma nova sessão de usuário.
  #
  # POST /api/v1/users/sign_in
  # {
  #   "user": {
  #     "email": "test@email.com",
  #     "password": "123456"
  #   }
  # }
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

  # Manipula a resposta após a criação da sessão de usuário.
  #
  # @param resource [User] O usuário autenticado.
  # @param _opts [Hash] Opções adicionais (não utilizadas neste caso).
  def respond_with(resource, _opts = {})
    render json: resource, status: 200
  end

  # Responde à ação de encerramento de sessão.
  def respond_to_on_destroy
    head 204
  end
end
