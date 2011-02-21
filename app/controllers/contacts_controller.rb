class ContactsController < ApplicationController
  def new
    @menu = Article.show_menu_list
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new
    if @contact.save(params[:contact])
      return render :text => "jest wszystko ok!"
    else
      return render :text => "cos poszlo nie tak!"
    end
    return render :text => "params #{params[:contact].to_yaml}"
  end

end
