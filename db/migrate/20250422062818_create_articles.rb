# create_articles は articlesテーブルを作成するマイグレーション
# タイトル、本文をカラムで定義する
class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
