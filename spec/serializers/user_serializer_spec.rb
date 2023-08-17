require 'rails_helper'

RSpec.describe UserSerializer do
  let(:user) { build_stubbed(:user) }
  let(:serializer) { described_class.new(user) }
  let(:serialization) { serializer.serializable_hash }

  it 'includes the expected attributes' do
    expect(serialization[:data][:attributes].keys).to contain_exactly(:id, :email, :created_at)
  end
end
