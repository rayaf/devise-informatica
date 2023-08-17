# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RamMemory, type: :model do
  it { should have_many(:ram_slots) }
  it { should have_many(:orders).through(:ram_slots) }
end
