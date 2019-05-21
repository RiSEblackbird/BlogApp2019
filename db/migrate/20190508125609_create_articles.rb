class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :category, null: false    #カテゴリ
      t.string :title, null: false    #タイトル
      t.text :body, null: false    #本文

      t.timestamps
    end
  end
end
