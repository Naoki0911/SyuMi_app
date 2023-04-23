require 'rails_helper'

RSpec.describe "Sakes", type: :system do
  let!(:user) {FactoryBot.create(:user)}
  let!(:sake) { FactoryBot.create(:sake, user: user) }
  let!(:second_sake) { FactoryBot.create(:second_sake, user: user) }

  describe "投稿一覧画面確認テスト" do
    context 'ログインした場合' do
      it "投稿一覧画面が表示されること" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit sakes_path
        expect(page).to have_content("日本酒投稿一覧")
      end
    end
  end

  describe "新規投稿テスト" do
    context '新規投稿画面に遷移した場合' do
      it "新規投稿画面が表示される" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit new_sake_path
        expect(page).to have_content("新規投稿")
      end
    end

    context '新規投稿画面にて投稿した場合' do
      it "投稿が新規作成されている" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit new_sake_path
        fill_in "sake_name", with: "Test Sake"
        fill_in "sake_content", with: "Test Content"
        fill_in "sake_place", with: "Test Content"
        fill_in "sake_sweetness", with: "1"
        fill_in "sake_flavor", with: "2"
        fill_in "sake_sour", with: "3"
        fill_in "sake_feeling", with: "4"
        fill_in "sake_rich", with: "5"
        click_button "登録する"

        expect(page).to have_content("投稿しました")
        expect(page).to have_content("Test Sake")
      end
    end
  end
  

  describe "投稿編集テスト" do
    context '投稿の編集画面に遷移した場合した場合' do
      it "投稿の編集画面が表示される" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit edit_sake_path(sake)

        expect(page).to have_content("編集")
      end
    end

  
    context '投稿編集画面にて更新した場合' do
      it "投稿内容が更新されている" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit edit_sake_path(sake)
        fill_in "sake_name", with: "Updated Sake"
        click_button "更新する"

        expect(page).to have_content("投稿を更新しました")
        expect(page).to have_content("Updated Sake")
      end
    end
  end

  describe "投稿削除機能テスト" do
    context '投稿を削除した場合' do
      it "投稿一覧画面から削除した投稿が消えている" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit sakes_path
        accept_confirm do
          click_link '削除', match: :first
        end
        sleep(0.5)
        expect(page).not_to have_content 'Test Sake'
        expect(page).to have_content("投稿を削除しました")
      end
    end
  end

  describe "投稿検索機能テスト" do
    context '投稿を日本酒名で検索した場合' do
      it "検索ワードと一致する日本酒名の投稿のみが表示される" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit sakes_path
        fill_in "日本酒名か生産地（都道府県まで）", with: "Test Sake"
        click_button "検索"
        expect(page).to have_content("Test Sake")
        expect(page).not_to have_content("Example Sake")
      end
    end

    context '投稿を生産地で検索した場合' do
      it "検索ワードと一致する生産地の投稿のみが表示される" do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        visit sakes_path
        fill_in "日本酒名か生産地（都道府県まで）", with: "東京都"
        click_button "検索"
        expect(page).to have_content("Test Sake")
        expect(page).not_to have_content("Example Sake")
      end
    end
  end
end