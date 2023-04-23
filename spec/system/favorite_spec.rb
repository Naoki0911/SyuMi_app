require 'rails_helper'

RSpec.describe 'お気に入り管理機能', type: :system do
  let!(:user) {FactoryBot.create(:user)}
  let!(:second_user){FactoryBot.create(:second_user)}
  let!(:sake) { FactoryBot.create(:sake, user: user) }
  let!(:second_sake) { FactoryBot.create(:second_sake, user: user) }
  describe 'お気に入り追加機能のテスト' do
    context 'お気に入りに追加した場合' do
      it 'お気に入りされていること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'user_password', with: 'password2'
        click_button 'ログイン'
        click_link '詳細を見る', match: :first
        sleep(2)
        click_link 'お気に入りする'
        click_link '詳細を見る', match: :first
        expect(page).to have_content 'お気に入り解除する'
      end
    end

    context 'お気に入りを削除した場合' do
      it 'お気に入りが削除されること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'user_password', with: 'password2'
        click_button 'ログイン'
        click_link '詳細を見る', match: :first
        sleep(2)
        click_link 'お気に入りする'
        click_link 'マイページ'
        click_link 'お気に入り一覧'
        click_link '詳細を見る', match: :first
        sleep(2)
        click_link 'お気に入り解除する'
        expect(page).to have_content 'お気に入り解除しました'
      end
    end
  end

  describe 'お気に入り一覧機能のテスト' do
    context 'お気に入りした場合' do
      it 'お気に入り一覧に表示されること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'user_password', with: 'password2'
        click_button 'ログイン'
        click_link '詳細を見る', match: :first
        sleep(0.5)
        click_link 'お気に入りする'
        click_link 'マイページ'
        click_link 'お気に入り一覧'
        expect(page).to have_content 'Example Sake'
        expect(page).to have_content '福岡県'
      end
    end
  end
end