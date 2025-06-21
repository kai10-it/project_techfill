class User < ApplicationRecord
  # 入力されるデータをチェックする
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  # ユーザーは複数の記事を作成し、所有することができる
  # ユーザーが削除された時は、そのユーザーが作成した記事もすべて削除される
  has_many :articles, dependent: :destroy

  # ユーザーは複数のコメントを行うことができる
  # ユーザーが削除された時は、そのユーザーのコメントもすべて削除される
  has_many :comments, dependent: :destroy
end
