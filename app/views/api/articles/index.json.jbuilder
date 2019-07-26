json.set! :articles do
  json.array! @articles do |article|
    json.extract! article, :id, :user_id, :title, :body, :created_at, :updated_at, :like_count, :comment_count, :stock_count
  end
end
