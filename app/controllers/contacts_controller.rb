class ContactsController < ApplicationController
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      respond_to do |format|
        format.html { redirect_to root_path, notice:  "Contact sent successfully" }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice:  "Error registering contact" }
        format.js
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
