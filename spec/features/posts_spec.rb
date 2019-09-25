require 'rails_helper'

RSpec.feature "Posts", type: :feature do

  let(:user) { FactoryBot.create(:user) }

  scenario '新規記事の作成と投稿' do
    sign_in_as user
    visit root_path
    click_link "新規記事作成"
    fill_in "タイトルを記載", with: 'ケ〜ムケ〜ムクンパッツ'
    fill_in "本文を記載", with: '数あるクンパッツの中でも二ツケム製の商品は特筆すべき性能の高さを誇ります。'
    fill_in "タグを追加(複数可)", with: '二ツケム, クンパッツ'
    click_button "上記の内容で投稿する"
    expect(page).to have_content "記事を投稿しました！"
  end
end
