class ProcessorSerializer
  include JSONAPI::Serializer
  attributes :id, :product, :brand

  has_many :orders, serializer: OrderSerializer 
end
