class RenameCommentsTableToComments < ActiveRecord::Migration[8.0]
  def change
    rename_table :comments_tables, :comments
  end
end
