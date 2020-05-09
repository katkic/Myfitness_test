require 'rails_helper'

RSpec.describe 'トレーニングメニュー登録機能', type: :model do
  describe 'トレーニングメニュー登録時のバリデーション' do
    before do
      @menu = build(:menu)
    end

    context 'メニュー名が未入力の場合' do
      before do
        @menu.name = ''
      end

      it '無効な状態であること' do
        expect(@menu).not_to be_valid
      end
    end

    context 'メニュー名が21文字以上の場合' do
      before do
        @menu.name = 'a' * 21
      end

      it '無効な状態であること' do
        expect(@menu).not_to be_valid
      end
    end
  end
end
