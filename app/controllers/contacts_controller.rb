class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    return render :text => "params #{params.to_yaml}"
    
  end
end
