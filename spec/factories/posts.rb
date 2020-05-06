FactoryBot.define do
  factory :post do
    content { '投稿テスト' }
    user
  end
end
