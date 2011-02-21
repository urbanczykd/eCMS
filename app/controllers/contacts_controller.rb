class ContactsController < ApplicationController
  def new
    @menu = Article.show_menu_list
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new
    if (params[:contact].nil? || params[:contact][:title].blank?)
      redirect_to new_contact_path, :notice => t("contact.title_fail")
    elsif (params[:contact][:message].blank?) 
      redirect_to new_contact_path, :notice => t("contact.message_fail")
    elsif (params[:contact][:sender_email].blank? )
      redirect_to new_contact_path, :notice => t("contact.sender_fail")
    elsif ( (params[:contact][:sender_email] =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i) == nil)  
      redirect_to new_contact_path, :notice => t("contact.valid_sender_fail")
    else  
          if @contact.save(params[:contact])
            redirect_to root_path, :notice => t("contact.message_success")      
          else
            return render :text => t("contact.message_fail")
          end
    end
  end

end
