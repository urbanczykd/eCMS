class ContactsController < ApplicationController
  def new
    @menu = Article.show_menu_list
    @contact = Contact.new
  end
  
  def create
#    return render :text => "#{params[:contact].to_hash.to_yaml}"
    @contact = Contact.new
#    return render :text => "#{@contact.to_yaml}"
    if @contact.save(params[:contact])
      return render :text => "jest wszystko ok!"
    else
      return render :text => "cos poszlo nie tak!"
    end
#    @contact = Contact.new(params)
#    if(params[:title].empty?)
#      return render :text => "jest empty title!"
#    elsif(params[:message].empty?)
#      return render :text => "jest empty message!"
#    elsif(params[:sender_email].empty?)
#      return render :text => "jest empty sender email"
#    end
    return render :text => "params #{params[:contact].to_yaml}"
    
  end
end
