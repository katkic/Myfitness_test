FactoryBot.define do
  factory :menu do
    name { '基本セットA' }
    interval { 2 }
    user

    trait :skip_validate do
      to_create { |instance| instance.save(validate: false) }
    end
  end
end
