# frozen_string_literal: true

# Migration para criar a tabela de memórias RAM.
class CreateRamMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :ram_memories do |t|
      t.string :product
      t.integer :size

      t.timestamps
    end
  end
end
