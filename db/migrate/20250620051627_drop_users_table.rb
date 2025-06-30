class DropUsersTable < ActiveRecord::Migration[8.0]
  def change
    remove_reference :articles, :user rescue nil
    remove_reference :comments, :user rescue nil

    drop_table :users
  end
end
