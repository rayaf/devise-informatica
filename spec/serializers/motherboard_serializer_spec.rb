require 'rails_helper'

RSpec.describe MotherboardSerializer do
  let(:order) { build_stubbed(:order) }
  let(:motherboard) { build_stubbed(:motherboard, orders: [order]) }
  let(:serializer) { described_class.new(motherboard) }
  let(:serialization) { serializer.serializable_hash }

  it 'includes the expected attributes' do
    expect(serialization[:data][:attributes].keys).to contain_exactly(:id, :product, :supported_processor, :memory_slots, :max_ram, :onboard_vga)
  end

  it 'includes the associated orders' do
    expect(serialization[:data][:relationships][:orders][:data].first[:id]).to eq(order.id.to_s)
  end
end
