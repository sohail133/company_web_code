class Setting < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :location, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  enum status: { inactive: 0, active: 1 }  
  attr_accessor :facebook_url, :twitter_url, :instagram_url, :linkedin_url, :skype_url

  validate :social_urls_validations

  before_save :deactivate_other_active_settings
  after_save :deactivate_other_inactive_settings

  private

  def social_urls_validations
    if social_urls["facebook_url"].present? && !social_urls['facebook_url'].match(/\Ahttps?:\/\/(www\.)?facebook\.\S+\z/)
      errors.add(:social_urls, "Facebook URL must be a valid URL.")
      return false
    end

    if social_urls['twitter_url'].present? && !social_urls['twitter_url'].match(/\Ahttps?:\/\/(www\.)?twitter\.\S+\z/)
      errors.add(:social_urls, "Twitter URL must be a valid URL.")
      return false
    end

    if social_urls['instagram_url'].present? && !social_urls['instagram_url'].match(/\Ahttps?:\/\/(www\.)?instagram\.\S+\z/)
      errors.add(:social_urls, "Instagram URL must be a valid URL.")
      return false
    end

    if social_urls['linkedin_url'].present? && !social_urls['linkedin_url'].match(/\Ahttps?:\/\/(www\.)?linkedin\.\S+\z/)
      errors.add(:social_urls, "Linkedin URL must be a valid URL.")
      return false
    end

    if social_urls['skype_url'].present? && !social_urls['skype_url'].match(/\Ahttps?:\/\/(www\.)?skype\.\S+\z/)
      errors.add(:social_urls, "Skype URL must be a valid URL.")
      return false
    end
  end
  
  def deactivate_other_active_settings
    if status == 'active'
      Setting.where.not(id: id).where(status: 'active').update_all(status: 'inactive')
    end
  end
  
  def deactivate_other_inactive_settings
    if Setting.where(status: 'active').count == 0
      first_record = Setting.last
      first_record.update(status: 'active')
    end
  end
end
