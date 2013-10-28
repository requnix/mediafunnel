class UsersController < ApplicationController
  skip_before_filter :create_guest_user, only: :sign_in
  skip_before_filter :find_user,         only: :sign_in

  def sign_in
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id

      flash[:notice] = "You have successfully logged in."
      redirect_to shows_path
    else
      flash[:alert] = "Those credentials were incorrect."
      redirect_to root_path
    end
  end

  def sign_out
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      redirect_to '/shows', flash: { success: 'Client user was successfully updated.' }
    else
      render :edit
    end
  end

  def user_params
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    params[:user].permit!
  end
end
