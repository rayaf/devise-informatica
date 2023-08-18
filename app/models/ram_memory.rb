# frozen_string_literal: true

# Representa uma memória RAM utilizada em Orders.
class RamMemory < ApplicationRecord
  # Associação com slots de memória RAM (ram_slots).
  has_many :ram_slots
  # Associação com pedidos (orders) através dos slots de memória RAM.
  has_many :orders, through: :ram_slots
end
