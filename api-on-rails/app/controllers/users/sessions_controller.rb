# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  
  before_action :configure_sign_in_params, only: [:create ,:new,:destroy]

  # GET /resource/sign_in
  def new
    super
    @users = policy_scope(User)
    authorize(@user)
  end

  # POST /resource/sign_in
  def create
    super
    @users = policy_scope(User)
    authorize(@user)
  end

  # DELETE /resource/sign_out
  def destroy
    super
    @users = policy_scope(User)
    authorize(@user)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
