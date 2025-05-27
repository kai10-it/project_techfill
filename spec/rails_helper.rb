# spec_helper.rbの設定を読み込む
require 'spec_helper'

# RAILS_ENV（Railsの実行環境）が設定されていない場合は、test環境として動かす
ENV['RAILS_ENV'] ||= 'test'

# environment.rb を相対パスで読み込み、Rails全体の設定や初期化を行う
require_relative '../config/environment'

# 実行環境が本番（production）なら、安全のためテストを中止する
abort("The Rails environment is running in production mode!") if Rails.env.production?

# RSpecでRailsの機能（モデルやコントローラなど）を使えるようにする
require 'rspec/rails'

# マイグレーションの状態をチェックして、未実行ならエラーを出してテストを止める
begin
  # テスト用のデータベースが最新のデータベース構成になっているか確認をする
  ActiveRecord::Migration.maintain_test_schema!
# まだ実行されていないマイグレーションがある場合
rescue ActiveRecord::PendingMigrationError => e
  # プログラムを終了し、エラーメッセージを文字列に変換し、文字列の両端にある空白をなくす
  abort e.to_s.strip
end

# RSspecの設定を実行する
RSpec.configure do |config|
  # fixtures というテストデータの置き場所を設定する
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # テストごとにデータベースの変更を自動で元に戻す
  config.use_transactional_fixtures = true

  # エラーが発生した際に rails 内部のバックトレースを省略する
  config.filter_rails_from_backtrace!
end
