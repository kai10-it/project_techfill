# drop_comments_tableはcommentsテーブルを削除するマイグレーション
class DropCommentsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :comments do |t|
      t.text :content

      t.timestamps
    end
  end
end
