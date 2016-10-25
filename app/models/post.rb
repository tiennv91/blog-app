class Post < ActiveRecord::Base
  # for Friendly ID
	extend FriendlyId
	friendly_id :title, use: :slugged

	# for post tags
	acts_as_taggable # Alias for acts_as_taggable_on :tags

  validates :title, presence: true
  validates_presence_of :tag_list

  has_attached_file :cover_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.jpg"
  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    where("lower(title) LIKE '%#{search.downcase}%' OR description LIKE '%#{search.downcase}%'")
  end

  scope :published, -> {where(:draft => "false")}
end
