# frozen_string_literal: true

# Serializador para a classe Motherboard.
class MotherboardSerializer
  include JSONAPI::Serializer

  # Define os atributos a serem serializados.
  attributes :id, :product, :supported_processor, :memory_slots, :max_ram, :onboard_vga

  # Define a associação com pedidos (orders) e especifica o serializador a ser usado.
  has_many :orders, serializer: OrderSerializer
end
