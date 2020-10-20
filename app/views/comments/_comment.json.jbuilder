json.extract! comment, :id, :title, :body, :deal_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
