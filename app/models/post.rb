class Post < ActiveRecord::Base
	# for Friendly ID
	extend FriendlyId
	friendly_id :title, use: :slugged

	# for post tags
	acts_as_taggable # Alias for acts_as_taggable_on :tags

	# for search fulltext
	searchable do
    text :title
    text :description
    text :content
    time :created_at
  end

  validates :title, presence: true

  has_attached_file :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.jpg"
  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\z/

end
