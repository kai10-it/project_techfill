# create_users_tableはuserテーブルを作成するマイグレーション
# ユーザー名、メールアドレス、パスワードをカラムで定義する
class AddUsersTable < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
