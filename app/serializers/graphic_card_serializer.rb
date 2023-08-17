class GraphicCardSerializer
  include JSONAPI::Serializer
  attributes :id, :product

  has_many :orders, serializer: OrderSerializer
end
