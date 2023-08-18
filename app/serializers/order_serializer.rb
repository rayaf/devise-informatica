# frozen_string_literal: true

# Serializador para a classe Order.
class OrderSerializer
  include JSONAPI::Serializer
  # Define os atributos a serem serializados.
  attributes :id

  # Define as associações com slots de memória RAM, processador, placa-mãe e placa gráfica,
  # e especifica os serializadores a serem usados.
  has_many :ram_slots, serializer: RamSlotSerializer
  belongs_to :processor, serializer: ProcessorSerializer
  belongs_to :motherboard, serializer: MotherboardSerializer
  belongs_to :graphic_card, serializer: GraphicCardSerializer
end
