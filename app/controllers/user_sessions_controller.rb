class UserSessionsController < ApplicationController
  before_filter :expire_index, :only => [:destroy]

  def new
    @user_session = UserSession.new
    @menu = Article.show_menu_list

  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
      if @user_session.save
  #    flash[:notice] = "Successfully logged in."
  #      if @user_session.user.role.name == 'user'
  #        redirect_to root_url
  #      elsif @user_session.user.role.name == 'admin'
          redirect_to admin_path
  #      end
        elsif
        render :action => 'new'
      end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
#    session[:path]=nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end



end
