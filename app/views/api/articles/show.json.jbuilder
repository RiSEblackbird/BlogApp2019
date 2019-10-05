# frozen_string_literal: true

json.set! :article do
  json.extract! @article, :id, :user_id, :title, :body, :created_at, :updated_at, :like_count, :comment_count, :stock_count
end
