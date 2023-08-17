# frozen_string_literal: true

class Motherboard < ApplicationRecord
  has_many :orders

  enum supported_processor: {
    intel: 0,
    amd: 1,
    intel_amd: 2
  }
end
