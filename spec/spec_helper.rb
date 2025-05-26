RSpec.configure do |config|
  # RSpecのマッチャー（比較ルール）を設定する
  config.expect_with :rspec do |expectations|
    # 独自マッチャーを複数条件（チェーン）で使ったとき、説明文を省略せずにすべて表示する設定
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # RSpecのモック（偽のメソッド）を設定する
  config.mock_with :rspec do |mocks|
    # 存在しないメソッドをモックしようとした場合にエラーを出す設定
    mocks.verify_partial_doubles = true
  end

  # shared_context（共通の設定）を、describe や context に自動で適用できるようにする設定
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
