FactoryBot.define do
  factory :profile do
    height { 175.0 }
    self_introduction { 'こんにちは' }
    user
  end
end
