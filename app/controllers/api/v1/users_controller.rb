# frozen_string_literal: true

# Controller responsável pelas operações relacionadas a usuários na API V1.
class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  # Obtém detalhes do usuário autenticado.
  #
  # GET /api/v1/users
  def index
    render json: current_user, status: 200
  end

end
