require 'rails_helper'

RSpec.describe Motherboard, type: :model do
  it { should have_many(:orders) }

  it { should define_enum_for(:supported_processor).with_values(intel: 0, amd: 1, intel_amd: 2) }
end
