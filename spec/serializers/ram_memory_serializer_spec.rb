require 'rails_helper'

RSpec.describe RamMemorySerializer do
  let(:order) { build_stubbed(:order) }
  let(:ram_memory) { build_stubbed(:ram_memory, orders: [order]) }
  let(:serializer) { described_class.new(ram_memory) }
  let(:serialization) { serializer.serializable_hash }

  it 'includes the expected attributes' do
    expect(serialization[:data][:attributes].keys).to contain_exactly(:id, :product, :size)
  end

  it 'includes the associated orders' do
    expect(serialization[:data][:relationships][:orders][:data].first[:id]).to eq(order.id.to_s)
  end
end
