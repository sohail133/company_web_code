class Admin::ContactsController < Admin::BaseController
  before_action :set_contact, only: [:show, :destroy, :update]

  def index
    @contacts = Contact.all
    @contacts = @contacts.where('lower(name) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @contacts = @contacts.paginate(page: params[:page], per_page: 12)
  end
  
  def show
    if !@contact.read
      @contact.update(read: true)
      redirect_to admin_contact_path(@contact)
    end 
  end
  
  def update
    if @contact.update(status: params[:status])
      redirect_to admin_contacts_path, notice: "Contact status updated to #{params[:status]}."
    else
      render :edit
    end
  end
  
  def mark_all_as_read
    Contact.update_all(read: true)
    redirect_to admin_contacts_path, notice: "Contact marked all read"
  end

  def mark_as
    @contact = Contact.find(params[:id])
    if @contact.read
      @contact.update(read: false)
      redirect_to admin_contacts_path, notice: "Contact marked as Unread"
    else
      @contact.update(read: true)
      redirect_to admin_contacts_path, notice: "Contact marked as read"
    end
  end 

  def destroy
    redirect_to admin_contacts_path, 
    notice: 'Contact Detail was Successfully Deleted.' if @contact.destroy
  end
  private

  def set_contact
    @contact = Contact.find(params[:id])
  end
end