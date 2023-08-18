# frozen_string_literal: true

# Representa uma GraphicCard utilizada em Orders.
class GraphicCard < ApplicationRecord
  # Associação com pedidos (orders).
  has_many :orders
end
