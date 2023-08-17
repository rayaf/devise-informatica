FactoryBot.define do
  factory :motherboard do
    product { 'Asus ROG' }
    supported_processor { 'intel' }
    memory_slots { 2 }
    max_ram { '16' }
    onboard_vga { true }
  end
end
