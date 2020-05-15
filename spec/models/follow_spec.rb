require 'rails_helper'

RSpec.describe 'follow / unfollow', type: :model do
  let!(:user_a) { create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let!(:user_b) { create(:user, name: 'ユーザーB', email: 'b@example.com') }

  describe 'ユーザーをフォローする' do
    context '自分がユーザーBをフォローしたとき (follow! method)' do
      before do
        user_a.follow!(user_b)
      end

      it 'フォロー中のユーザーの中に、ユーザーBが含まれていること' do
        expect(user_a.following).to include(user_b)
      end
    end

    context 'ユーザーBに自分がフォローされたとき (follow! method)' do
      before do
        user_b.follow!(user_a)
      end

      it '自分のフォロワーの中に、ユーザーBが含まれていること' do
        expect(user_b.following).to include(user_a)
      end
    end

    context '自分はユーザーBをフォローしているか？ (following? method)' do
      before do
        user_a.follow!(user_b)
      end

      it 'フォローしていれば、trueを返す' do
        expect(user_a.following?(user_b)).to be_truthy
      end
    end
  end

  describe 'ユーザーをフォロー解除する' do
    before do
      user_a.follow!(user_b)
    user_b.follow!(user_a)
    end

    context '自分がユーザーBをフォロー解除したとき (unfollow method)' do
      before do
        user_a.unfollow(user_b)
      end

      it 'フォロー中のユーザーの中に、ユーザーBが含まれていないこと' do
        expect(user_a.following).not_to include(user_b)
      end
    end

    context 'ユーザーBが自分をフォロー解除したとき (unfollow method)' do
      before do
        user_b.unfollow(user_a)
      end

      it '自分のフォロワーの中に、ユーザーBが含まれていないこと' do
        expect(user_b.following).not_to include(user_a)
      end
    end

    context '自分はユーザーBをフォローしているか？ (following? method)' do
      before do
        user_a.unfollow(user_b)
      end

      it 'フォローしていなければ、falseを返す' do
        expect(user_a.following?(user_b)).to be_falsey
      end
    end
  end
end
