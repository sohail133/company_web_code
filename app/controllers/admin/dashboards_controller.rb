class Admin::DashboardsController < Admin::BaseController
  def index
    @services_count = Service.count
    @portfolios_count = Portfolio.count
    @technologies_count = Technology.count
    @contacts_pending_count = Contact.where(status: 'pending').count
    @contacts_accepted_count = Contact.where(status: 'accepted').count
    @contacts_rejected_count = Contact.where(status: 'rejected').count
  end
end