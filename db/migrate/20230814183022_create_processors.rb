class CreateProcessors < ActiveRecord::Migration[6.1]
  def change
    create_table :processors do |t|
      t.string :product
      t.integer :brand

      t.timestamps
    end
  end
end
