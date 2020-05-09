require 'rails_helper'

RSpec.describe 'トレーニングメニュー管理機能', type: :system do
  describe '作成機能' do
    before do
      @user = create(:user)
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_on 'ログイン'
      click_on 'メニュー作成'

    end

    context 'メニューを作成した場合' do
      before do
        create(:exercise, user: @user)
        create(:exercise2, preset: true, user: @user)
        create(:exercise3, preset: true, user: @user)
        fill_in 'メニュー名', with: 'サンプルメニュー'
        check 'ベンチプレス'
        check 'スクワット'
        check 'ダンベルベンチプレス'
        click_on '登録する'
      end

      it '作成したメニューが表示されていること' do
        expect(page).to have_content 'メニュー「サンプルメニュー」を作成しました'
      end
    end
  end
end
