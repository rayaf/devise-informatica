require 'rails_helper'

RSpec.describe GraphicCard, type: :model do
  it { should have_many(:orders) }
end
