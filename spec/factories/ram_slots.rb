FactoryBot.define do
  factory :ram_slot do
    association :order, factory: :order
    association :ram_memory, factory: :ram_memory
  end
end
