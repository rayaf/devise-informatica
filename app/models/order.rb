# frozen_string_literal: true

# Representa um pedido no sistema.
class Order < ApplicationRecord
  # Associação com slots de memória RAM (ram_slots).
  has_many :ram_slots, dependent: :destroy
  # Associação com memórias RAM através dos slots de memória RAM.
  has_many :ram_memories, through: :ram_slots, dependent: :destroy
  
  # Associação com um usuário.
  belongs_to :user
  # Associação com um processador.
  belongs_to :processor
  # Associação com uma placa-mãe.
  belongs_to :motherboard
  # Associação com uma placa gráfica (opcional).
  belongs_to :graphic_card, optional: true

  # Permite atributos aninhados para os slots de memória RAM.
  accepts_nested_attributes_for :ram_slots

  # Valida a presença do processador, placa-mãe e slots de memória RAM.
  validates_presence_of :processor, :motherboard, :ram_slots

  # Valida a contagem dos slots de memória RAM em relação à placa-mãe.
  validate :validate_ram_slots_count
  # Valida a contagem e o tamanho total das memórias RAM em relação à placa-mãe.
  validate :validate_ram_size_count
  # Valida a presença de uma placa gráfica quando não há VGA onboard na placa-mãe.
  validate :validate_graphic_card_presence
  # Valida a compatibilidade entre processador e placa-mãe.
  validate :validate_processor_motherboard_compatibility

  private

  # Define os atributos que podem ser utilizados para pesquisa usando a gem Ransack.
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "graphic_card_id", "id", "motherboard_id", "processor_id", "updated_at", "user_id"]
  end

  # Valida a contagem dos slots de memória RAM em relação à placa-mãe.
  def validate_ram_slots_count
    return if ram_slots.nil? || motherboard.nil?

    if ram_slots.size > motherboard.memory_slots
      errors.add(:ram_slots, "too many RAM memories for the available memory slots")
    end
  end

  # Valida a contagem e o tamanho total das memórias RAM em relação à placa-mãe.
  def validate_ram_size_count
    return if ram_slots.nil? || motherboard.nil?

    total_ram_size = ram_slots.map { |slot| slot.ram_memory.size }.sum
    if total_ram_size > motherboard.max_ram
      errors.add(:motherboard, "Total RAM size exceeds the maximum")
    end
  end

  # Valida a presença de uma placa gráfica quando não há VGA onboard na placa-mãe.
  def validate_graphic_card_presence
    return if motherboard.nil?

    if !motherboard.onboard_vga && graphic_card.nil?
      errors.add(:graphic_card, "must be present when onboard VGA isn't")
    end
  end

  # Valida a compatibilidade entre processador e placa-mãe.
  def validate_processor_motherboard_compatibility
    return if processor.nil? || motherboard.nil?

    unless motherboard.supported_processor.include?(processor.brand)
      errors.add(:base, "Processor and motherboard brands are not compatible")
    end
  end
end
