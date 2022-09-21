class Comment < ApplicationRecord
  # *validation
  validates :body, presence: true

  # *association
  belongs_to :commentable, polymorphic: true
  # belongs_to :photo, counter_cache: true

  # Callback
  after_create :increment_photos_count
  after_destroy :decrement_photos_count

  private

  def increment_photos_count
    return unless commentable.is_a?(Photo)

    comment_photo = commentable
    comment_photo.comments_count += 1
    comment_photo.save
  end

  def decrement_photos_count
    return unless commentable.is_a?(Photo)

    comment_photo = commentable
    comment_photo.comments_count -= 1
    comment_photo.save
  end
end
