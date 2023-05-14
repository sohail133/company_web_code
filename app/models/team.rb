class Team < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_one_attached :image
  enum status: { inactive: 0, active: 1 }
  validates :name, presence: true
  validates :designation, presence: true
  validate :image_presence_and_type
  
  validates :facebook_url, 
            format: { with: /\Ahttps?:\/\/(www\.)?facebook\.\S+\z/, message: "must be a valid. Please provide Facebook URL." }, 
            allow_blank: true
  validates :twitter_url, 
            format: { with: /\Ahttps?:\/\/(www\.)?twitter\.\S+\z/, message: "must be a valid. Please provide Twitter URL." }, 
            allow_blank: true 
  validates :linkedin_url, 
            format: { with: /\Ahttps?:\/\/(www\.)?linkedin\.\S+\z/, message: "must be a valid. Please provide Linkedin URL." }, 
            allow_blank: true
  validates :instagram_url, 
            format: { with: /\Ahttps?:\/\/(www\.)?instagram\.\S+\z/, message: "must be a valid. Please provide Instagram URL." }, 
            allow_blank: true

  private

  def image_presence_and_type
    if !image.attached?
      errors.add(:image, 'must be attached')
    elsif !image.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:image, 'must be PNG, JPG or JPEG image)')
    end
  end
end
