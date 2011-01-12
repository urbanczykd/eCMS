class AdminController < ApplicationController
  layout 'admin'


  def index
  end

  private
  
  def user_account
    if current_user.nil? || current_user.role.name.downcase != 'admin'
      redirect_to(login_path, :notice => "You must login first !")
    end
  end 
  
end
