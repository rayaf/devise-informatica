# frozen_string_literal: true

# Migration para criar a tabela de processadores.
class CreateProcessors < ActiveRecord::Migration[6.1]
  def change
    create_table :processors do |t|
      t.string :product
      t.integer :brand

      t.timestamps
    end
  end
end
