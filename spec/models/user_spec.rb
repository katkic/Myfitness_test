require 'rails_helper'

RSpec.describe 'ユーザー登録機能', type: :model do
  describe 'ユーザー登録時のバリデーション' do
    before do
      @user = build(:user)
    end

    context 'ユーザー名が未入力の場合' do
      before do
        @user.name = ''
      end

      it '無効な状態であること' do
        expect(@user).not_to be_valid
      end
    end

    context 'ユーザー名が21文字以上の場合' do
      before do
        @user.name = 'a' * 21
      end

      it '無効な状態であること' do
        expect(@user).not_to be_valid
      end
    end

    context 'メールアドレスが未入力の場合' do
      before do
          @user.email = ''
      end

      it '無効な状態であること' do
        expect(@user).not_to be_valid
      end
    end

    context 'メールアドレスが正しい形式でない場合' do
      before do
          @user.email = 'hoge'
      end

      it '無効な状態であること' do
        expect(@user).not_to be_valid
      end
    end

    context 'emailが重複している場合' do
      before do
        create(:user, name: 'ユーザーB', email: 'sample@test.com')
        @user_c = build(:user, name: 'ユーザーC', email: 'sample@test.com')
      end

      it '無効な状態であること' do
        expect(@user_c).not_to be_valid
      end
    end

    context 'パスワードが未入力の場合' do
      before do
        @user.password = ''
      end

      it '無効な状態であること' do
        expect(@user).not_to be_valid
      end
    end

    context 'パスワードが6文字未満である場合' do
      before do
          @user.password = 'pass'
      end

      it '無効な状態であること' do
        expect(@user).not_to be_valid
      end
    end
  end
end
