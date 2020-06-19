class Post < ApplicationRecord
  belongs_to :user
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
  has_one_attached :image

  validates :description, :image, presence: true

end
