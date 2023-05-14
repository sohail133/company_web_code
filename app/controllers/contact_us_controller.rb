class ContactUsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
      flash[:notice] = 'Your Message is successfully sent'
    else
      flash[:alert] = 'There was an error sending your message'
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
