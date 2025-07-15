FactoryBot.define do
  factory :user do
    name { 'テスト太郎' }
    email { 'test@example.com' }
    password { 'password' }
  end
end
