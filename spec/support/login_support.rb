module LoginSupport
  def sign_in_as(user)
    visit root_path
    click_link "ログイン"
    fill_in "アカウント名", with: user.username
    fill_in "Eメールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
