FactoryBot.define do
  factory :exercise1, class: Exercise do
    name { 'ベンチプレス' }
    part { 1 }
    category { 1 }
    description { '大胸筋を鍛えます。' }
    preset { true }
    user
  end

  factory :exercise2, class: Exercise do
    name { 'スクワット' }
    part { 2 }
    category { 1 }
    description { '脚を鍛えます。' }
    preset { false }
    user
  end

  factory :exercise3, class: Exercise do
    name { 'ダンベルベンチプレス' }
    part { 1 }
    category { 1 }
    description { '大胸筋を鍛えます。' }
    preset { false }
    user
  end

  factory :exercise4, class: Exercise do
    name { 'チェストプレス' }
    part { 1 }
    category { 2 }
    description { '大胸筋を鍛えます。' }
    preset { false }
    user
  end
end
