class OrderSerializer
  include JSONAPI::Serializer
  attributes :id

  has_many :ram_slots, serializer: RamSlotSerializer
  belongs_to :processor, serializer: ProcessorSerializer
  belongs_to :motherboard, serializer: MotherboardSerializer
  belongs_to :graphic_card, serializer: GraphicCardSerializer
end
