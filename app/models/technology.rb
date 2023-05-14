class Technology < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_one_attached :image
  validates :image, presence: { message: "must be attached" }
  enum status: { inactive: 0, active: 1 }  
  
  validate :image_presence_and_type

  private

  def image_presence_and_type
    if !image.attached?
      errors.add(:image, 'must be attached')
    elsif !image.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:image, 'must be PNG, JPG or JPEG image)')
    end
  end
end
