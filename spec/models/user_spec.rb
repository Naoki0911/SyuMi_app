require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password') }
  let(:other_user) { User.create(email: 'other_user@example.com', password: 'password', password_confirmation: 'password') }

  describe '#follow!' do
    it '別のユーザーをフォローする' do
      user.follow!(other_user)
      expect(user.following?(other_user)).to be_truthy
    end
  end

  describe '#unfollow!' do
    it '別のユーザーのフォローを解除する' do
      user.follow!(other_user)
      user.unfollow!(other_user)
      expect(user.following?(other_user)).to be_falsy
    end
  end

  describe '#follow' do
    it '別のユーザーをフォローする' do
      user.follow(other_user)
      expect(user.following?(other_user)).to be_truthy
    end
  end

  describe '#following?' do
    context 'ユーザーをフォローしている場合' do
      it 'trueを返す' do
        user.follow(other_user)
        expect(user.following?(other_user)).to be_truthy
      end
    end

    context 'ユーザーをフォローしていない場合' do
      it 'falseを返す' do
        expect(user.following?(other_user)).to be_falsy
      end
    end
  end

  describe '.guest' do
    it 'ゲストユーザーを作成' do
      guest_user = User.guest
      expect(guest_user.email).to eq 'guest@example.com'
    end
  end

  describe '.guest_admin' do
    it 'ゲスト管理ユーザーを作成' do
      guest_admin_user = User.guest_admin
      expect(guest_admin_user.email).to eq 'admin_guest@example.com'
      expect(guest_admin_user.admin).to be_truthy
    end
  end
end