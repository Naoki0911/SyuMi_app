require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:sake) { FactoryBot.create(:sake, user: user) }
  let!(:comment) { FactoryBot.create(:comment, sake: sake, user: user) }

  describe 'コメント投稿のテスト' do
    context 'コメントを投稿する場合' do
      it '投稿されたコメントが表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link '詳細'
        sleep(5)
        fill_in 'comment_reply', with: 'いいね！'
        click_button 'コメントする'
        sleep(1)
        expect(page).to have_content 'いいね！'
      end
    end

    context 'コメントを削除する場合' do
      it '削除されたコメントがなくなる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link '詳細を見る'
        sleep(3)
        accept_confirm do
          click_link '削除', match: :first
        end
        sleep(1)
        expect(page).not_to have_content 'example_comment'
      end
    end
  end
end