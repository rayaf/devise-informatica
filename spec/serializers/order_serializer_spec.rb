require 'rails_helper'

RSpec.describe OrderSerializer do
  let(:order) { create(:order) }
  let(:serializer) { described_class.new(order) }
  let(:serialization) { serializer.serializable_hash }

  it 'includes the expected attributes' do
    expect(serialization[:data][:attributes].keys).to contain_exactly(:id)
  end

  it 'includes the associated ram_slots' do
    ram_slot_id = order.ram_slots.first.id.to_s
    expect(serialization[:data][:relationships][:ram_slots][:data].first[:id]).to eq(ram_slot_id)
  end

  it 'includes the associated processor' do
    expect(serialization[:data][:relationships][:processor][:data][:id]).to eq(order.processor.id.to_s)
  end

  it 'includes the associated motherboard' do
    expect(serialization[:data][:relationships][:motherboard][:data][:id]).to eq(order.motherboard.id.to_s)
  end

  it 'includes the associated graphic_card' do
    expect(serialization[:data][:relationships][:graphic_card][:data][:id]).to eq(order.graphic_card.id.to_s)
  end
end
