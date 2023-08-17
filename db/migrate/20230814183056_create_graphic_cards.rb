class CreateGraphicCards < ActiveRecord::Migration[6.1]
  def change
    create_table :graphic_cards do |t|
      t.string :product

      t.timestamps
    end
  end
end
