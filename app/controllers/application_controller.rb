class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :create_guest_user, except: :landing
  before_filter :find_user

  def landing

  end

  def create_guest_user
    if session[:user_id].blank?
      @user = User.create! :username => "guest#{rand(9999)}", :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com", password: "password", password_confirmation: "password"
      session[:user_id] = @user.id
    end
  end

  def find_user
    if session[:user_id]
      @user = User.find session[:user_id]
    end
  end
end
