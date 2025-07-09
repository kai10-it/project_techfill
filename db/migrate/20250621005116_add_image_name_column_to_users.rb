# add_image_name_column_to_usersはusersテーブルに画像名のカラムを追加するマイグレーション
class AddImageNameColumnToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :image_name, :string
  end
end
