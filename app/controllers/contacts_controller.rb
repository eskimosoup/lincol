class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new(@contact).deliver_now
      respond_to do |format|
        format.js { flash.now[:notice] = 'Thank you for your submission. We will be in touch.' }
        format.html { flash.now[:notice] = 'Thank you for your submission. We will be in touch.' }
      end
    else
      respond_to do |format|
        format.js { render :new }
        format.html { render :new }
      end
    end
  end

  def footer_form
    respond_to do |format|
      format.js
    end
  end

  def sidebar_form
    respond_to do |format|
      format.js
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :message, :company_name, :telephone, :form)
    end
end
