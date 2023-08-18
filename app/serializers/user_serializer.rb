# frozen_string_literal: true

# Serializador para a classe User.
class UserSerializer
  include JSONAPI::Serializer
  # Define os atributos a serem serializados.
  attributes :id, :email, :created_at
end
