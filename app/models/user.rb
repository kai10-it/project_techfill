class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :avatar

  # ユーザーは複数の記事を作成し、所有することができる
  # ユーザーが削除された時は、そのユーザーが作成した記事もすべて削除される
  has_many :articles, dependent: :destroy

  # ユーザーは複数のコメントを行うことができる
  # ユーザーが削除された時は、そのユーザーのコメントもすべて削除される
  has_many :comments, dependent: :destory
end
