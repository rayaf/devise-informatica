# frozen_string_literal: true

# Representa uma placa-mãe utilizada em Orders.
class Motherboard < ApplicationRecord
  # Associação com pedidos (orders).
  has_many :orders

  # Enumeração que define os processadores suportados pela motherboard.
  enum supported_processor: {
    intel: 0,
    amd: 1,
    intel_amd: 2
  }
end
