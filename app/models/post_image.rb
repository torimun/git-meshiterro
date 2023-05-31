class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :shop_name, presence: true
end
