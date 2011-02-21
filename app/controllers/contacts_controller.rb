class ContactsController < ApplicationController
  def new
    @menu = Article.show_menu_list
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new
    if @contact.save(params[:contact])
      redirect_to root_path, :notice => "Wiadomosc zostala pomyslnie wyslana"      
    else
      return render :text => "cos poszlo nie tak!"
    end
  end

end
