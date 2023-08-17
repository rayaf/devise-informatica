# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
Processor.create!(product: 'Core i5', brand: 0)
Processor.create!(product: 'Core i7', brand: 0)
Processor.create!(product: 'Ryzen 5', brand: 1)
Processor.create!(product: 'Ryzen 7', brand: 1)

Motherboard.create!(product: 'Asus ROG', supported_processor: 0, memory_slots: 2, max_ram: 16, onboard_vga: false)
Motherboard.create!(product: 'Gigabyte Aorus', supported_processor: 1, memory_slots: 2, max_ram: 16, onboard_vga: false)
Motherboard.create!(product: 'ASRock Steel Legend', supported_processor: 2, memory_slots: 4, max_ram: 64, onboard_vga: true)

RamMemory.create!(product: 'Kingston Hiper X', size: 4)
RamMemory.create!(product: 'Kingston Hiper X', size: 8)
RamMemory.create!(product: 'Kingston Hiper X', size: 16)
RamMemory.create!(product: 'Kingston Hiper X', size: 32)
RamMemory.create!(product: 'Kingston Hiper X', size: 64)

GraphicCard.create!(product: 'Evga Geforce RTX 2060 6GB')
GraphicCard.create!(product: 'Asus ROG Strix Geforce RTX 3060 6GB')
GraphicCard.create!(product: 'Gigabyte Radeon RX 6600 XT EAGLE 8GB')
