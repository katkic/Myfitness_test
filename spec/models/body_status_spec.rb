require 'rails_helper'

RSpec.describe '体重・体脂肪記録機能', type: :model do
  describe '体重・体脂肪登録時のバリデーション' do
    before do
      user = FactoryBot.create(:user)
      @body_status = FactoryBot.create(:body_status, user: user)
    end

    context '体重が未入力の場合' do
      before do
        @body_status.body_weight = nil
      end

      it '無効な状態であること' do
        expect(@body_status).not_to be_valid
      end
    end

    context '体重の入力が数値でない場合' do
      before do
        @body_status.body_weight = 'hoge'
      end

      it '無効な状態であること' do
        expect(@body_status).not_to be_valid
      end
    end

    context '体重の入力が1以上の数値でない場合' do
      before do
          @body_status.body_weight = -70
      end

      it '無効な状態であること' do
        expect(@body_status).not_to be_valid
      end
    end

    context '体脂肪の入力が数値でない場合' do
      before do
          @body_status.body_fat = 'hoge'
      end

      it '無効な状態であること' do
        expect(@body_status).not_to be_valid
      end
    end

    context '体脂肪の入力が1以上の数値でない場合' do
      before do
        @body_status.body_fat = -20
      end

      it '無効な状態であること' do
        expect(@body_status).not_to be_valid
      end
    end
  end

  describe 'MBIの計算 #BodyStatus.get_bmi' do
    before do
      @height = 175.0
      @weight = 69.1
    end

    it '身長175cm, 体重69.1kgのBMIが22であること' do
      expect(BodyStatus.get_bmi(@height, @weight).floor).to eq 22
    end
  end
end
