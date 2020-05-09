FactoryBot.define do
  factory :exercise_log do
    set { 1 }
    weight { 50.0 }
    rep { 10 }
    workout
  end
end
