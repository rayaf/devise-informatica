# frozen_string_literal: true

# Migration para criar a tabela de slots de memórias ram.
class CreateRamSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :ram_slots do |t|
      t.references :ram_memory, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
