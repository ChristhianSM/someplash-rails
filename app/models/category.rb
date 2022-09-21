class Category < ApplicationRecord
  # *validation
  validates :name, presence: true, uniqueness: true
  validates :cover, presence: true
  # validates :cover, presence: true
  validates :description, length: { maximum: 300, message: " should be at least 300 characters" }


  # *association
  has_many :photos, dependent: :destroy
  # pholymorphic
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :cover
end
