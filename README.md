# 概要
簡易な個人ブログサービスの作成を目的としています。  
[BlogApp2019(https://peaceful-reaches-94880.herokuapp.com/)](https://peaceful-reaches-94880.herokuapp.com/)  

## 基本機能概要
### ユーザー関連(Userモデル)
 - ログイン機能
 - 画像アップロード機能(AWS S3)
 - 管理者権限＆管理画面機能
 - ユーザー一覧表示
 - ユーザー詳細表示
 - ユーザー詳細ページでの投稿物等一覧表示   
 - ユーザーのフォロー機能(Relationshipモデル)
	 - 誰が、誰を、何人に、何人から、関係性と集計を記録

### 記事関連(Articleモデル)
 - 記事投稿＆編集機能
	 - 記事はマークダウン記法に対応
		 - 編集中にタブ切り替えにより表示プレビューの確認が可能
	 - 記事には複数のタグを付与可能(Tagモデル)
   - 画像アップロード機能(AWS S3)
 - 記事一覧表示  
	 - モーダル形式で記事詳細、アカウント詳細をプレビュー可能
	 - アカウントや記事のプレビュー内にて、記事へのコメント投稿やアカウントのフォローが可能
 - 記事詳細表示
	 - いいね機能(Likeモデル)
		 - いいねは記事ごとに集計、記事詳細のいいねボタンに集計を表示
	 - コメント投稿機能(Commentモデル)

### その他
 - ページネーション機能

## 実装取り組み中の技術
 - AWS EC2への本アプリのデプロイ
 - RSpecによるテスト実装  

---  


# 使用技術
| 技術 or ツール | 名称 |
|:-------------|:-----|
| 言語 | Ruby 2.5.3 |
| サーバサイドフレームワーク | Ruby on Rails 5.2.3 |
| 開発用DB | SQLite |
| 本番用DB | PostgreSQL |
| インフラ | Heroku |
| フロントエンドフレームワーク | Bootstrap4 |

# 付加機能
| 技術 or ツール | 名称 |
|:-------------|:-----|
| ログイン機能 | [device](https://github.com/plataformatec/devise) |
| AWS S3との接続 | [aws-sdk-s3](https://github.com/aws/aws-sdk-ruby) |
| 権限管理機能 | [CanCan](https://github.com/ryanb/cancan) |
| ユーザー管理画面 | [RailsAdmin](https://github.com/sferik/rails_admin) |
| 記事タグ付け機能 | [ActsAsTaggableOn](https://github.com/mbleigh/acts-as-taggable-on) |
| 画像リサイズ機能 | [MiniMagick](https://github.com/minimagick/minimagick) |
| 画像アップロード機能 | [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) |
| ページネーション | [kaminari](https://github.com/kaminari/kaminari) |
| 記事のマークダウン記法対応 | [Redcarpet](https://github.com/vmg/redcarpet) |

# 開発補助機能
| 技術 or ツール | 名称 |
|:-------------|:-----|
| エラー詳細表示 | [Better Errors](https://github.com/BetterErrors/better_errors) |
| ChromeでのRails情報表示 | [MetaRequest](https://github.com/dejan/rails_panel/tree/master/meta_request) |
| 静的コード解析 | [RuboCop](https://github.com/rubocop-hq/rubocop) |
| アプリ名変更 | [rename](https://github.com/morshedalam/rename) |

# (実装予定)
| 技術 or ツール | 名称 |
|:-------------|:-----|
| テスト(単体・結合) | RSpec |
| インフラ | AWS |

# (使用検討中)
| 技術 or ツール | 名称 |
|:-------------|:-----|
| 仮想化 | Docker |
| CI/CD | CircleCI |
