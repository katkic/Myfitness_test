require 'rails_helper'

RSpec.describe 'トレーニング種目', type: :system do
  describe 'トレーニング種目の管理機能' do
    let(:user_b) { create(:user, name: 'ユーザーB', email: 'b@example.com') }

    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_on 'ログイン'
      click_on '種目メニュー'
    end

    context '種目を一般ユーザーが新規作成したとき' do
      let(:login_user) { user_b }
      before do
        click_on '新規作成'
        fill_in '種目名', with: 'サンプル種目'
        select '胸', from: '部位'
        select 'フリーウェイト', from: 'カテゴリー'
        fill_in '説明', with: '種目の登録テストです。'
        click_on '登録する'
      end

      it '種目が登録されること' do
        expect(page).to have_content 'トレーニング種目「サンプル種目」を登録しました'
        expect(page).to have_content 'オリジナル'
      end
    end

    context '種目一覧のオリジナルタブをクリックしたとき' do
      let(:login_user) { user_b }

      before do
        create(:exercise, name: 'サンプル種目', preset: false)
        page.all('.tab-label')[1].click
      end

      it '登録した種目が表示されること' do
        expect(page).to have_content 'サンプル種目'
      end
    end
  end
end
