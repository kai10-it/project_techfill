# Article は技術記事を表すモデル
# ユーザーが投稿する記事のタイトル、本文を管理する
class Article < ApplicationRecord
  validates :title, { presence: true }
  validates :body, { presence: true }
end
