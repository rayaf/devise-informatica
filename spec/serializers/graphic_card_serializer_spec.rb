require 'rails_helper'

RSpec.describe GraphicCardSerializer do
  let(:order) { build_stubbed(:order) }
  let(:graphic_card) { build_stubbed(:graphic_card, orders: [order]) }
  let(:serializer) { described_class.new(graphic_card) }
  let(:serialization) { serializer.serializable_hash }

  it 'includes the expected attributes' do
    expect(serialization[:data][:attributes].keys).to contain_exactly(:id, :product)
  end

  it 'includes the associated orders' do
    expect(serialization[:data][:relationships][:orders][:data].first[:id]).to eq(order.id.to_s)
  end
end
