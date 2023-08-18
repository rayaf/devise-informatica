# frozen_string_literal: true

# Serializador para a classe Processor.
class ProcessorSerializer
  include JSONAPI::Serializer
  # Define os atributos a serem serializados.
  attributes :id, :product, :brand

  # Define a associação com pedidos (orders) e especifica o serializador a ser usado.
  has_many :orders, serializer: OrderSerializer
end
