FactoryBot.define do
  factory :workout do
    condition { 3 }
    memo { '' }
    user
    exercise
  end
end
