class NewsusersController < ApplicationController

  def create
    @newsuser = Newsuser.new(params[:newsuser])
    if @newsuser.save
      redirect_to root_path, :notice => "Mail zostal poprawnie zapisany"
    else
      redirect_to root_path, :notice => "Mail nie zostal zapisany"
    end
  end
  def show
#    return render :text => "params #{params[:id].to_yaml}"
    @newsuser = Newsuser.find_by_email(params[:id])
    @secret = @newsuser.secret
    if @newsuser != nil && @secret == params[:secret]
      @newsuser.destroy
      redirect_to root_path, :notice => "Email usuniety z bazy"
    else
      return render :text => "cos sie zjebalo#{@newsuser.to_yaml}"
    end
  end
  
end
