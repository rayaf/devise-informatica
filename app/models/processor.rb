class Processor < ApplicationRecord
  has_many :orders
  
  enum brand: {
      intel: 0,
      amd: 1,
    }
end
