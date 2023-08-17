require 'rails_helper'

RSpec.describe RamSlotSerializer do
  let(:ram_slot) { build_stubbed(:ram_slot) }
  let(:serializer) { described_class.new(ram_slot) }
  let(:serialization) { serializer.serializable_hash }

  it 'includes the expected attributes' do
    expect(serialization[:data][:attributes].keys).to contain_exactly(:id, :ram_memory_id, :order_id)
  end

  it 'includes the associated order' do
    expect(serialization[:data][:relationships][:order][:data][:id]).to eq(ram_slot.order.id.to_s)
  end

  it 'includes the associated ram_memory' do
    expect(serialization[:data][:relationships][:ram_memory][:data][:id]).to eq(ram_slot.ram_memory.id.to_s)
  end
end
