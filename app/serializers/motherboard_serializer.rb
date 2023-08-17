class MotherboardSerializer
  include JSONAPI::Serializer
  attributes :id, :product, :supported_processor, :memory_slots, :max_ram, :onboard_vga

  has_many :orders, serializer: OrderSerializer
end
