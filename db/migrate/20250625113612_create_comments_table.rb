class CreateCommentsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :comments_tables do |t|
      t.text :comment
      t.string :article_id
      t.string :user_id

      t.timestamps
    end
  end
end
