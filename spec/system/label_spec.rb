require 'rails_helper'

RSpec.describe "ラベル機能", type: :system do
  describe 'ラベル機能確認テスト' do
    let!(:user){ FactoryBot.create(:user) }
    let!(:label) { FactoryBot.create(:label) }
    let(:label_id) { label.id }
    context 'ラベル機能を使って投稿した場合' do
      before do
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
        check "label-#{label_id}"
        click_button "登録する"
        click_link "戻る"
      end

      it '投稿されたものにラベルが付いている' do
        expect(page).to have_content "Test Feature"
      end
    end
  
    context 'ラベル機能を使って投稿されたレビューのラベルを外した場合' do
      before do
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
        check "label-#{label_id}"
        click_button "登録する"
        click_link "戻る"
        click_link "編集する"
        sleep 2
        uncheck "label-#{label_id}"
        click_button "更新する"
      end
      it '投稿されたレビューのラベルが外れている' do
        expect(page).not_to have_content "Test Feature"
      end
    end
  end
end