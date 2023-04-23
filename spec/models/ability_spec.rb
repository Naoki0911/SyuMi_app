require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  describe '権限管理' do
    context '管理者ユーザーの場合' do
      let(:admin_user) { User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true) }
      subject(:ability) { Ability.new(admin_user) }

      it 'RailsAdminへのアクセスが許可されていること' do
        is_expected.to be_able_to(:access, :rails_admin)
      end

      it '全てのリソースに対して管理が許可されていること' do
        is_expected.to be_able_to(:manage, :all)
      end
    end

    context '一般ユーザーの場合' do
      let(:user) { User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password') }
      subject(:ability) { Ability.new(user) }

      it 'RailsAdminへのアクセスが許可されていないこと' do
        is_expected.not_to be_able_to(:access, :rails_admin)
      end

      it '全てのリソースに対して管理が許可されていないこと' do
        is_expected.not_to be_able_to(:manage, :all)
      end
    end

    context 'ゲストユーザーの場合' do
      subject(:ability) { Ability.new(nil) }

      it 'RailsAdminへのアクセスが許可されていないこと' do
        is_expected.not_to be_able_to(:access, :rails_admin)
      end

      it '全てのリソースに対して管理が許可されていないこと' do
        is_expected.not_to be_able_to(:manage, :all)
      end
    end
  end
end