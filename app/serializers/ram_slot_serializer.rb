class RamSlotSerializer
  include JSONAPI::Serializer
  attributes :id, :ram_memory_id, :order_id

  belongs_to :order, serializer: OrderSerializer
  belongs_to :ram_memory, serializer: RamMemorySerializer
end
