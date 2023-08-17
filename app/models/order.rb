# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :ram_slots
  has_many :ram_memories, through: :ram_slots
  
  belongs_to :processor
  belongs_to :motherboard
  belongs_to :graphic_card, optional: true

  accepts_nested_attributes_for :ram_slots

  validates_presence_of :processor, :motherboard, :ram_slots

  validate :validate_ram_slots_count
  validate :validate_graphic_card_presence
  validate :validate_processor_motherboard_compatibility
  validate :validate_ram_size_count


  private

  def validate_ram_slots_count
    return if ram_slots.nil? || motherboard.nil?

    if ram_slots.size > motherboard.memory_slots
      errors.add(:ram_slots, "too many RAM memories for the available memory slots")
    end
  end

  def validate_ram_size_count
    return if ram_slots.nil? || motherboard.nil?

    total_ram_size = ram_slots.map { |slot| slot.ram_memory.size }.sum
    if total_ram_size > motherboard.max_ram
      errors.add(:motherboard, "Total RAM size exceeds the maximum")
    end
  end

  def validate_graphic_card_presence
    return if motherboard.nil?

    if !motherboard.onboard_vga && graphic_card.nil?
      errors.add(:graphic_card, "must be present when onboard VGA isn't")
    end
  end

  def validate_processor_motherboard_compatibility
    return if processor.nil? || motherboard.nil?

    unless motherboard.supported_processor.include?(processor.brand)
      errors.add(:base, "Processor and motherboard brands are not compatible")
    end
  end
end
