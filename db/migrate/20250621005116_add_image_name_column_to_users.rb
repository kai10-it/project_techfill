class AddImageNameColumnToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :image_name, :string
  end
end
