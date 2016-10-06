json.extract! post, :id, :title, :cover_image, :slug, :description, :content, :draft, :created_at, :updated_at
json.url post_url(post, format: :json)