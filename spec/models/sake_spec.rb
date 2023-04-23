require 'rails_helper'

RSpec.describe Sake, type: :model do

  let(:user) { User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password') }
  let(:sake) do
    Sake.create(
      name: 'Example Sake',
      content: 'Example content',
      place: 'Example place',
      sweetness: 3,
      flavor: 2,
      sour: 1,
      feeling: 4,
      rich: 3,
      user: user
    )
  end
  
  describe 'バリデーション' do
    it '有効なsake' do
      expect(sake).to be_valid
    end

    it 'nameが空の場合は無効' do
      sake.name = nil
      expect(sake).to_not be_valid
    end

    it 'contentが空の場合は無効' do
      sake.content = nil
      expect(sake).to_not be_valid
    end

    it 'placeが空の場合は無効' do
      sake.place = nil
      expect(sake).to_not be_valid
    end

    it 'sweetnessが範囲外の場合は無効' do
      sake.sweetness = 6
      expect(sake).to_not be_valid
    end

    it 'flavorが範囲外の場合は無効' do
      sake.flavor = -1
      expect(sake).to_not be_valid
    end

    it 'sourが範囲外の場合は無効' do
      sake.sour = 6
      expect(sake).to_not be_valid
    end

    it 'feelingが範囲外の場合は無効' do
      sake.feeling = -1
      expect(sake).to_not be_valid
    end

    it 'richが範囲外の場合は無効' do
      sake.rich = 6
      expect(sake).to_not be_valid
    end
  end
end