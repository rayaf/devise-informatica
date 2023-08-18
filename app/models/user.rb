# frozen_string_literal: true

# Representa um usuário no sistema.
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Associação com pedidos (orders).
  has_many :orders

  # Configuração do Devise para autenticação e geração de tokens JWT.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
