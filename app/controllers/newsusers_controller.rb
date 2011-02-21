class NewsusersController < ApplicationController

  def new
        @menu = Article.show_menu_list
        @newsuser = Newsuser.new
  end
  
  def create
    @newsuser = Newsuser.new(params[:newsuser])
    if @newsuser.save
      redirect_to root_path, :notice => t("newsletter.mail_success")
    else
      redirect_to root_path, :notice => t("newsletter.mail_save_fail")
    end
  end
  
  
  def show
    @newsuser = Newsuser.find_by_email(params[:id])
    @secret = @newsuser.secret
    if (@newsuser != nil && @secret == params[:secret])
      @newsuser.destroy
      redirect_to root_path, :notice => t("newsletter.mail_delete")
    else
      redirect_to root_path, :notice => t('newsletter.mail_error')
    end
  end
  
end
