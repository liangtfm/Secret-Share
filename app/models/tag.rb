class Tag < ActiveRecord::Base
  attr_accessible :name, :creator_id

  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :creator,
  class_name: "User",
  foreign_key: :creator_id,
  primary_key: :id

  has_many :secret_taggings,
  class_name: "SecretTagging",
  foreign_key: :tag_id,
  primary_key: :id

  has_many :secrets,
  through: :secret_taggings,
  source: :secret

  has_one :creator,
  through: :secret_taggings,
  source: :creator

end
