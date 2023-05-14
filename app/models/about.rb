class About < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :description, presence: true
  has_one_attached :image
  enum status: { inactive: 0, active: 1 }
  
  validate :image_presence_and_type
  before_save :deactivate_other_active_abouts
  after_save :deactivate_other_inactive_settings

  private

  def image_presence_and_type
    if !image.attached?
      errors.add(:image, 'must be attached')
    elsif !image.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:image, 'must be PNG, JPG or JPEG image)')
    end
  end
  
  def deactivate_other_active_abouts
    if status == 'active'
      About.where.not(id: id).where(status: 'active').update_all(status: 'inactive')
    end
  end

  def deactivate_other_inactive_settings
    if About.where(status: 'active').count == 0
      first_record = About.last
      first_record.update(status: 'active')
    end
  end  
end
