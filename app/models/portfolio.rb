class Portfolio < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  enum status: { inactive: 0, active: 1 }
  
  default_scope -> { order(created_at: :desc) }
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true
  validates :client, presence: true
  validates :project_date, presence: true
  validates :project_url, presence: true,
   format: { with: /\Ahttps?:\/\/[\S]+\z/, 
    message: "must be a valid URL" }
  validates :description, presence: true

  validate :image_presence_and_type

  private
  
  def image_presence_and_type
    if !images.attached?
      errors.add(:images, 'must be attached')
    end  
    images.each do |image|
      unless image.content_type.in?(%w[image/png image/jpg image/jpeg])
        errors.add(:images, 'must be a PNG, JPG, or JPEG image')
      end
    end
  end
end
