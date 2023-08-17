# frozen_string_literal: true

class GraphicCard < ApplicationRecord
  has_many :orders
end
