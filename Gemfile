source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# 認証機能（ユーザー登録・ログイン用）
gem "devise"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Active Storageの画像加工に必要となる
gem "image_processing", "~> 1.2"

group :development, :test do
  # デバッグ用Gem https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # セキュリティ診断ツール -アプリに脆弱性がないかチェックする [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # RubocopをRails向けにプリセットした構成で使うことができる -コードスタイルチェック用 [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # RSpecの本体 -Railsのテストを書くためのライブラリ
  gem "rspec-rails"
end

group :development do
  # エラー画面にインタラクティブなコンソールを表示する [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # ブラウザ操作を自動化するための統合テスト用ライブラリ [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"

  # ChromeやFirefoxなどのブラウザを自動で操作するドライバ
  gem "selenium-webdriver"
end
