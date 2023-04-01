class AddIconImageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :icon_image, :string
  end
end
