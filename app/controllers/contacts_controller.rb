class ContactsController < ApplicationController
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contact sent successfully"
      redirect_to contact_path
    else
      flash[:error] = "Error registering contact"
      redirect_to contact_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
