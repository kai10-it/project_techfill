# add_user_id_column_to_articlesはarticleテーブルにuser_idのカラムを追加するマイグレーション
class AddUserIdColumnToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :user_id, :string
  end
end
