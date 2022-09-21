class Photo < ApplicationRecord
  # *validation
  validates :title, presence: true, uniqueness: true
  validates :image, presence: true
  validates :description, length: { maximum: 300, message: " should be maximum 300 characters" }

  # *association
  belongs_to :category, counter_cache: true
  # *Polymorphics
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image
end
