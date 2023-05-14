class Admin::BaseController < ActionController::Base
  before_action :authenticate_user!, :set_contacts
  layout 'admin'

  private

  def set_contacts
    @setting = Setting.where(status: 'active').take
    @recent_contacts = Contact.where(read: false).order(created_at: :desc).limit(5)
    @contacts_unread_count = Contact.where(read: false).count
  end
end
