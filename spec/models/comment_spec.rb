require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  describe 'バリデーション' do
    it 'replyが存在する場合、有効であること' do
      user = User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password')
      sake = Sake.create(name: 'Test Sake', content: 'Test Content', place: 'Test Place', sweetness: 1, flavor: 1, sour: 1, feeling: 1, rich: 1, user: user)
      comment = Comment.new(reply: 'Test Reply', sake: sake, user: user)
      expect(comment).to be_valid
    end

    it 'replyが存在しない場合、無効であること' do
      user = User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password')
      sake = Sake.create(name: 'Test Sake', content: 'Test Content', place: 'Test Place', sweetness: 1, flavor: 1, sour: 1, feeling: 1, rich: 1, user: user)
      comment = Comment.new(reply: nil, sake: sake, user: user)
      expect(comment).not_to be_valid
    end
  end
end