FactoryBot.define do
  factory :order do
    association :processor, factory: :processor
    association :motherboard, factory: :motherboard
    association :graphic_card, factory: :graphic_card

    after(:build) do |order|
      order.ram_slots << build(:ram_slot, order: order, ram_memory: build(:ram_memory))
    end
  end
end
