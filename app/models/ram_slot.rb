class RamSlot < ApplicationRecord
  belongs_to :ram_memory
  belongs_to :order
end