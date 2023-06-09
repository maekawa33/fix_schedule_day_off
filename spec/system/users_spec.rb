require 'rails_helper'

RSpec.describe 'Users' do
  let(:user) { create(:user) }

  describe 'ユーザー新規作成' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規作成が成功する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Example'
        fill_in 'メールアドレス', with: 'email@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '作成'
        expect(page).to have_content "ユーザー「Example」を作成しました"
        expect(page).to have_current_path schedules_path, ignore_query: true
      end
    end

    context '名前が未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: ''
        fill_in 'メールアドレス', with: 'example@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '作成'
        expect(page).to have_content 'ユーザーの作成に失敗しました'
        expect(page).to have_content 'ユーザー名を入力してください'
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context 'メールアドレスが未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Example'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '作成'
        expect(page).to have_content 'ユーザーの作成に失敗しました'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context 'パスワードが未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Example'
        fill_in 'メールアドレス', with: 'example@example.com'
        fill_in 'パスワード', with: ''
        fill_in 'パスワード（確認）', with: 'password'
        click_button '作成'
        expect(page).to have_content 'ユーザーの作成に失敗しました'
        expect(page).to have_content 'パスワードは3文字以上で入力してください'
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context 'パスワード（確認用）が未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Example'
        fill_in 'メールアドレス', with: 'example@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: ''
        click_button '作成'
        expect(page).to have_content 'ユーザーの作成に失敗しました'
        expect(page).to have_content 'パスワード（確認）を入力してください'
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context '作成済のメールアドレスを使用' do
      it 'ユーザーの新規作成が失敗する' do
        existed_user = create(:user)
        visit new_user_path
        fill_in 'ユーザー名', with: 'Example'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '作成'
        expect(page).to have_content 'ユーザーの作成に失敗しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end

    context 'パスワードが不一致' do
      it 'ユーザーの新規作成が失敗する' do
        existed_user = create(:user)
        visit new_user_path
        fill_in 'ユーザー名', with: 'Example'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'foobar'
        click_button '作成'
        expect(page).to have_content 'ユーザーの作成に失敗しました'
        expect(page).to have_content 'パスワード（確認）とパスワードの入力が一致しません'
        expect(page).to have_current_path users_path, ignore_query: true
      end
    end
  end
end
