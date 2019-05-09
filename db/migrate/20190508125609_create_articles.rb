class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :category, null: false    #カテゴリ
      t.string :title, null: false    #タイトル
      t.text :baby, null: false    #本文
      t.datetime :released_at, null: false    #掲載開始日

      t.timestamps
    end
  end
end
