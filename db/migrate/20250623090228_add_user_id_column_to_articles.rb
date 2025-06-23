class AddUserIdColumnToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :user_id, :string
  end
end
