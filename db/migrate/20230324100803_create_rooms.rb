class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
