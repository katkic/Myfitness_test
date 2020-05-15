require 'rails_helper'

RSpec.describe 'workoutのクラスメソッド', type: :model do
  let!(:user) { create(:user) }
  let!(:exercise) { create(:exercise, name: 'ベンチプレス', user: user) }
  let!(:exercise2) { create(:exercise, name: 'スクワット', user: user) }
  let!(:bench_press) { create(:workout, user: user, exercise: exercise) }
  let!(:squat) { create(:workout, user: user, exercise: exercise2) }
  let!(:exercise_log) { create(:exercise_log, set: 1, weight: 62.5, workout: bench_press) }
  let!(:exercise_log2) { create(:exercise_log, set: 2, weight: 60.0, workout: bench_press) }
  let!(:exercise_log3) { create(:exercise_log, set: 3, weight: 57.5, workout: bench_press) }

  before do
    @exercise_log = ExerciseLog.first
    @exercise_logs = ExerciseLog.limit(3)
  end

  describe 'トレーニングのセット数を取得 Workout.get_set' do
    it '行ったトレーニングのセット数を返すこと' do
      expect(Workout.get_set(@exercise_logs)).to eq 3
    end
  end

  describe 'トレーニングの最大weightを取得 Workout.get_max_weight' do
    it '行ったトレーニングの最大weightを返すこと' do
      expect(Workout.get_max_weight(@exercise_logs)).to eq 62.5
    end
  end

  describe 'トレーニングのトータル重量を取得 Workout.get_max_weight' do
    it '行ったトレーニングのトータル重量を返すこと' do
      expect(Workout.get_total_weight(@exercise_logs)).to eq 1800
    end
  end

  describe 'トレーニングの1RMを取得 Workout.get_one_rm_max' do
    context 'トレーニングが1repの場合' do
      before do
        create(:exercise_log, set: 1, weight: 60.0, rep: 1, workout: bench_press)
        create(:exercise_log, set: 2, weight: 62.5, rep: 1, workout: bench_press)
        @exercise_logs = ExerciseLog.offset(3)
      end

      it 'その重量を返すこと' do
        expect(Workout.get_one_rm_max(@exercise_logs)).to eq 62.5
      end
    end

    context 'トレーニングが複数repの場合' do
      before do
        create(:exercise_log, set: 1, weight: 62.5, rep: 10, workout: squat)
        create(:exercise_log, set: 2, weight: 60.0, rep: 10, workout: squat)
        @squat_logs = ExerciseLog.offset(3)
      end

      it 'ベンチプレスのとき、補正係数40.0で計算' do
        expect(Workout.get_one_rm_max(@exercise_logs)).to eq 78.1
      end

      it 'スクワットorデッドリフトの時、補正係数33.3で計算' do
        expect(Workout.get_one_rm_max(@squat_logs)).to eq 81.2
      end
    end
  end
end
