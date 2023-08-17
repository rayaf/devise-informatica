require 'rails_helper'

RSpec.describe RamSlot, type: :model do
  it { should belong_to(:ram_memory) }
  it { should belong_to(:order) }
end
