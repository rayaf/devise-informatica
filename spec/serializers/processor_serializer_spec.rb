require 'rails_helper'

RSpec.describe ProcessorSerializer do
  let(:order) { build_stubbed(:order) }
  let(:processor) { build_stubbed(:processor, orders: [order]) }
  let(:serializer) { described_class.new(processor) }
  let(:serialization) { serializer.serializable_hash }

  it 'includes the expected attributes' do
    expect(serialization[:data][:attributes].keys).to contain_exactly(:id, :product, :brand)
  end

  it 'includes the associated orders' do
    expect(serialization[:data][:relationships][:orders][:data].first[:id]).to eq(order.id.to_s)
  end
end
