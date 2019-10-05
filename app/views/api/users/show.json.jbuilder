# frozen_string_literal: true

json.set! :user do
  json.extract! @user, :id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at, :username, :admin_flg, :image, :profile, :follow_count, :follower_count, :like_count, :stock_count, :article_count, :comment_count
end
