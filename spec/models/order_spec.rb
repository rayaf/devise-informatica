require 'rails_helper'

RSpec.describe Order, type: :model do

  context 'validators' do
    subject { build(:order) }

    it { should have_many(:ram_slots) }
    it { should have_many(:ram_memories).through(:ram_slots) }
    it { should belong_to(:processor) }
    it { should belong_to(:motherboard) }
    it { should belong_to(:graphic_card).optional }
  
    it { should accept_nested_attributes_for(:ram_slots) }
  
    it { should validate_presence_of(:processor) }
    it { should validate_presence_of(:motherboard) }
    it { should validate_presence_of(:ram_slots) }
  end

  context 'validates RAM slots count' do
    let(:order) { build(:order) }

    it 'should fail' do
      order.ram_slots << build(:ram_slot, ram_memory: build_stubbed(:ram_memory))
      order.ram_slots << build(:ram_slot, ram_memory: build_stubbed(:ram_memory))
      order.ram_slots << build(:ram_slot, ram_memory: build_stubbed(:ram_memory))

      expect(order).to_not be_valid
      expect(order.errors[:ram_slots]).to include("too many RAM memories for the available memory slots")
    end
  end

  context 'validates RAM size count' do
    let(:ram_slot) { build_stubbed(:ram_slot, ram_memory: build_stubbed(:ram_memory, size:64))}
    let(:order) { build(:order) }

    it 'should fail' do
      order.ram_slots << ram_slot
      expect(order).to_not be_valid
      expect(order.errors[:motherboard]).to include("Total RAM size exceeds the maximum")
    end
  end

  context 'validates graphic card presence' do
    let(:order) { build(:order) }
    let(:motherboard) { build_stubbed(:motherboard) }

    context 'with onboard' do
      before do
        allow(order).to receive(:motherboard).and_return(motherboard)
      end

      it 'with gpu' do
        expect(order).to be_valid
      end

      it 'without gpu' do
        order.graphic_card = nil
        expect(order).to be_valid
      end
    end

    context 'without onboard' do
      before do
        allow(order).to receive(:motherboard).and_return(build_stubbed(:motherboard, onboard_vga: false))
      end

      it 'with gpu' do
        expect(order).to be_valid
      end

      it 'without gpu' do
        order.graphic_card = nil
        expect(order).to_not be_valid
        expect(order.errors[:graphic_card]).to include("must be present when onboard VGA isn't")
      end
    end
  end

  context 'validates processor-motherboard compatibility' do
    let(:processor) { build_stubbed(:processor, brand: 'amd') }
    let(:order) { build(:order, processor: processor) }

    it 'should fail' do
      expect(order).to_not be_valid
      expect(order.errors[:base]).to include("Processor and motherboard brands are not compatible")
    end
  end
end
