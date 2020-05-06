require 'rails_helper'

RSpec.describe '投稿機能', type: :model do
  describe '投稿作成時のバリデーション' do
    before do
      user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: user)
    end

    context '投稿が未入力の場合' do
      before do
        @post.content = nil
      end

      it '無効な状態であること' do
        expect(@post).not_to be_valid
      end
    end
  end
end
