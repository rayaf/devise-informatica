# frozen_string_literal: true

# Migration para criar a tabela de pedidos.
class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :processor, null: false, foreign_key: true
      t.references :motherboard, null: false, foreign_key: true
      t.references :graphic_card, foreign_key: true

      t.timestamps
    end
  end
end
