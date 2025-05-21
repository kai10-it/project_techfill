class Article < ApplicationRecord
  belongs_to :user

  # 記事には複数のコメントを投稿することができる
  # 記事が削除された場合は、記事に投稿されたコメントも削除される
  has_many :comments, dependent: :destroy
end
