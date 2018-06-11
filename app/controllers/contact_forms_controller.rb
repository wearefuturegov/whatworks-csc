class ContactFormsController < ApplicationController
  
  def new
    @form = ContactForm.new
  end
  
  def create
    @form = ContactForm.new(contact_form_params)
    if @form.deliver
      redirect_to '/', notice: 'Your form has been sent'
    else
      render :new
    end
  end
  
  private
  
  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :tel, :message)
  end
end
