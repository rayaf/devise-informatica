# frozen_string_literal: true

# Serializador para a classe RamSlot.
class RamSlotSerializer
  include JSONAPI::Serializer
  # Define os atributos a serem serializados.
  attributes :id, :ram_memory_id, :order_id

  # Define as associações com pedido (order) e memória RAM (ram_memory),
  # especificando os serializadores a serem usados.
  belongs_to :order, serializer: OrderSerializer
  belongs_to :ram_memory, serializer: RamMemorySerializer
end
