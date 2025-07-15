require 'rails_helper'

RSpec.describe User, type: :model do
  it '必要な情報を正しく入力すればユーザーを作成できるテスト' do
    user = create(:user)
    expect(user).to be_valid
  end
end
