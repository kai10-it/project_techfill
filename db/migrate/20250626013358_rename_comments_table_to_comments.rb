# renam_comments_table_to_commentsはcomments_tableテーブルをcommentsテーブルにリネームするマイグレーション
class RenameCommentsTableToComments < ActiveRecord::Migration[8.0]
  def change
    rename_table :comments_tables, :comments
  end
end
