class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])

    else
      flash.now[:danger] = "Ivalid email or password"
      render 'new'
    end
  end

  def destroy
  end
end
