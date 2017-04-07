require "rails_helper"

feature '新規登録' do
  feature '正常系' do
    scenario 'ニックネームが6文字' do
      visit new_user_registration_path

      fill_in "user_nickname", with: 'foo'
      fill_in "user_email", with: 'foo@example.com'
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: '00000000'
      click_on "Sign up"

      expect(current_path).to eq root_path
    end
  end

  feature '異常系' do
    scenario 'ニックネームが入力されていない' do
      visit new_user_registration_path

      fill_in "user_nickname", with: ''
      fill_in "user_email", with: 'foo@example.com'
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: '00000000'
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end

    scenario 'ニックネームが7文字' do
      visit new_user_registration_path

      fill_in "user_nickname", with: 'foofoof'
      fill_in "user_email", with: 'foo@example.com'
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: '00000000'
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end

    scenario 'メールアドレスが入力されていない' do
      visit new_user_registration_path

      fill_in "user_nickname", with: 'foo'
      fill_in "user_email", with: ''
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: '00000000'
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end

    scenario 'メールアドレスの形式が正しくない' do
      visit new_user_registration_path

      fill_in "user_nickname", with: 'foo'
      fill_in "user_email", with: 'foo'
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: '00000000'
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end

    scenario '登録済みのメールアドレスを入力する' do
      user = FactoryGirl.create(:user)

      visit new_user_registration_path

      fill_in "user_nickname", with: 'foo'
      fill_in "user_email", with: user.email
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: '00000000'
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end

    scenario 'パスワードが入力されていない' do
      visit new_user_registration_path

      fill_in "user_nickname", with: 'foo'
      fill_in "user_email", with: 'foo@example.com'
      fill_in "user_password", with: ''
      fill_in "user_password_confirmation", with: '00000000'
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end

    scenario 'パスワード(確認)が入力されていない' do
      visit new_user_registration_path

      fill_in "user_nickname", with: 'foo'
      fill_in "user_email", with: 'foo@example.com'
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: ''
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end

    scenario 'パスワードと確認が一致していない' do
      visit new_user_registration_path

      fill_in "user_nickname", with: 'foo'
      fill_in "user_email", with: 'foo@example.com'
      fill_in "user_password", with: '00000000'
      fill_in "user_password_confirmation", with: '00000001'
      click_on "Sign up"

      expect(current_path).not_to eq root_path
    end
  end
end

# feature 'ログインとログアウト' do
#   scenario 'ログインする' do

#   end
# end
