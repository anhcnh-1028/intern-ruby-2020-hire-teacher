class Business::SessionsController < BusinessController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate params[:session][:password]
      log_in @user
      redirect_to business_home_path
    else
      flash.now[:danger] = t "controller.sessions.invalid_login"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to business_login_path
  end
end
