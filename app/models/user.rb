# User はアプリケーションの利用者を表すモデル
# ユーザー情報（名前、メールアドレス、パスワード）を管理する
class User < ApplicationRecord
  # 入力されるデータをチェックする
  validates :name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password, { presence: true }
end
