class ContactsController < ApplicationController
  before_action :set_product, only: [:download_form, :create]

  def new
    @inpage_contact = Contact.new
  end

  def inpage_contact
    @inpage_contact = Contact.new(contact_params)
    if @inpage_contact.valid?
      ContactMailer.new(global_site_settings, @inpage_contact).deliver_now
      flash.now[:notice] = 'Thank you for your submission. We will be in touch.'
    else
      render :new
    end
  end

  def callback_form
    @contact = Contact.new
    render layout: 'ajax'
  end

  def download_form
    render layout: 'ajax'
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new(global_site_settings, @contact).deliver_now
      respond_to do |format|
        format.js {
          flash.now[:notice] = 'Thank you for your submission. We will be in touch.' unless @product.present?
          flash.now[:notice] = 'Thank you. You may now download the file.' if @product.present?
          @download = true if @product.present?
        }
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

    def set_product
      @product = ProductPresenter.new(object: Product.find(params[:id]), view_template: view_context) if params[:id].present?
    end
end
