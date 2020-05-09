FactoryBot.define do
  factory :menu do
    name { '基本セットA' }
    interval { 2 }
    user
  end
end
