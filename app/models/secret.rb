class Secret < ActiveRecord::Base
  attr_accessible :author_id, :recipient_id, :title, :tag_ids

  belongs_to :author, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  validates :author_id, :recipient_id, :title, :presence => true
  validates :title, length: { minimum: 2 }

  has_many :secret_taggings,
  class_name: "SecretTagging",
  foreign_key: :secret_id,
  primary_key: :id

  has_many :tags,
  through: :secret_taggings,
  source: :tag

end
