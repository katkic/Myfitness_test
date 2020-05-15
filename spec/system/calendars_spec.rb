require 'rails_helper'

RSpec.describe 'カレンダー', type: :system do
  describe '表示機能' do
    let(:user) { create(:user) }
    let(:exercise) { create(:exercise, name: 'ベンチプレス', user: user) }
    let(:workout) { create(:workout, user: user, exercise: exercise) }
    let!(:exercise_log) { create(:exercise_log, workout: workout) }

    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_on 'ログイン'
      sleep 0.5
      all('.footer-icon')[3].click
    end

    context 'トレーニングを記録したとき' do
      it 'カレンダーにトレーニングの履歴が表示されていること' do
        expect(page).to have_content 'ベンチプレス'
      end
    end

    context 'カレンダーのトレーニング履歴リンクをクリックしたとき' do
      before do
        click_on 'ベンチプレス'
      end

      it 'トレーニング記録の詳細画面が表示されること' do
        expect(page).to have_content '記録の詳細'
        expect(page).to have_content 'ベンチプレス'
      end
    end
  end
end
