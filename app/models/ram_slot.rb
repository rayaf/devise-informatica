# frozen_string_literal: true

# Representa um slot de memória RAM numa Order.
class RamSlot < ApplicationRecord
  # Associação com uma memória RAM (RamMemory).
  belongs_to :ram_memory
  # Associação com um pedido (Order).
  belongs_to :order
end
