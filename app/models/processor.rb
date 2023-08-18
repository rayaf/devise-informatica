# frozen_string_literal: true

# Representa um processador utilizado em Orders.
class Processor < ApplicationRecord
  # Associação com pedidos (orders).
  has_many :orders
  
  # Enumeração que define as marcas de processador.
  enum brand: {
      intel: 0,
      amd: 1,
    }
end
