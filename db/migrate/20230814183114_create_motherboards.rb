# frozen_string_literal: true

# Migration para criar a tabela de placa mãe.
class CreateMotherboards < ActiveRecord::Migration[6.1]
  def change
    create_table :motherboards do |t|
      t.string :product
      t.integer :supported_processor
      t.integer :memory_slots
      t.integer :max_ram
      t.boolean :onboard_vga

      t.timestamps
    end
  end
end
