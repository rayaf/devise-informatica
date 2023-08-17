require 'rails_helper'

RSpec.describe Processor, type: :model do
  it { should have_many(:orders) }

  it { should define_enum_for(:brand).with_values(intel: 0, amd: 1) }
end
