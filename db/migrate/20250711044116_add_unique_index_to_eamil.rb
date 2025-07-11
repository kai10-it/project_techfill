# usersテーブルのemailカラムにユニークインデックスを追加
class AddUniqueIndexToEamil < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :email, unique: true
  end
end
