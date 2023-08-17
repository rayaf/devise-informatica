class RamMemory < ApplicationRecord
  has_many :ram_slots
  has_many :orders, through: :ram_slots
end
