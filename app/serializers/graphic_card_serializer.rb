# frozen_string_literal: true

# Serializador para a classe GraphicCard.
class GraphicCardSerializer
  include JSONAPI::Serializer

  # Define os atributos a serem serializados.
  attributes :id, :product

  # Define a associação com pedidos (orders) e especifica o serializador a ser usado.
  has_many :orders, serializer: OrderSerializer
end
