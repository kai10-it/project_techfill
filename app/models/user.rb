class User < ApplicationRecord
  # 入力されるデータをチェックする
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
end
