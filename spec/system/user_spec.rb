require 'rails_helper'
RSpec.describe 'ユーザ機能', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:second_user){FactoryBot.create(:second_user)}

  describe 'ユーザ登録のテスト' do
    context 'ユーザを新規作成した場合' do
      it 'ユーザの新規登録がされる' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'New User'
        fill_in 'user_email', with: 'new@gmail.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ログインした場合' do
      it 'ログインした状態で日本酒投稿一覧が表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'ログインした場合' do
      it '自分の詳細画面(マイページ)に飛べる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'マイページ'
        expect(page).to have_content 'Test User'
      end
    end

    context 'ユーザが他人の詳細画面に飛ぶ場合' do
      it '花一覧画面に遷移する' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: '12345678'
        click_button 'ログイン'
        visit user_path(second_user)
        expect(page).to have_content 'Test Admin'
      end
    end

    context 'ログアウト' do
      it 'トップページに戻る' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'ログアウト'
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe '管理者機能のテスト' do
    context '管理ユーザが管理画面にアクセスする場合' do
      it 'アクセスできる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'user_password', with: 'password2'
        click_button "ログイン"
        click_link 'マイページ'
        click_link '管理者ページ'
        sleep(0.5)
        expect(page).to have_content 'サイト管理'
      end
    end

    context '管理ユーザがユーザの新規登録を行う場合' do
      it '登録できる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'user_password', with: 'password2'
        click_button "ログイン"
        click_link 'マイページ'
        click_link '管理者ページ'
        click_link 'ユーザー', match: :first
        click_link '新規作成'
        fill_in 'user_email', with: 'new@gmail.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        fill_in 'user_name', with: 'new'
        click_on "保存"
        expect(page).to have_content 'ユーザーの作成に成功しました'
      end
    end

    context '管理ユーザがユーザの削除をする場合' do
      it 'ユーザを削除できる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin@example.com'
        fill_in 'user_password', with: 'password2'
        click_button "ログイン"
        click_link 'マイページ'
        click_link '管理者ページ'
        click_link 'ユーザー', match: :first
        click_link '新規作成'
        fill_in 'user_email', with: 'new@gmail.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        fill_in 'user_name', with: 'new'
        click_on "保存"
        find('.delete_member_link a', match: :first).click
        click_button "実行する"
        expect(page).to have_content "ユーザーの削除に成功しました"
      end
    end
  end

  describe 'ユーザ情報のテスト' do
    context 'ユーザの情報を編集する場合' do
      it 'ユーザの情報が編集される' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'マイページ'
        click_link "編集"
        fill_in 'user_name', with: 'user2'
        fill_in 'user_email', with: 'user2@gmail.com'
        click_button '更新'
        expect(page).to have_content 'user2'
      end
    end
  end
end