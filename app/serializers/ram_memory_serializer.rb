class RamMemorySerializer
  include JSONAPI::Serializer
  attributes :id, :product, :size

  has_many :orders, serializer: OrderSerializer 
end
