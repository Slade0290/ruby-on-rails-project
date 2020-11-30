class Api::SessionsController < Api::BaseController


 # before_action :set_user

 # before_action :get_users_detail

skip_before_action :verify_authenticity_token

#before_action :authenticate_user! , only: :create

protect_from_forgery with: :null_session

def create
# super
   @user = User.where(email: params[:email]).first

    if @user.valid_password?(params[:password])
        session[:user_authenticity_token] = @user.authentication_token
        head(:ok)
    else
        head (:not_found)
    end

end

def destroy
    session[:user_authenticity_token] = nil
end


    def user_params
        params.require(:user).permit(:email, :password)
    end

      def configure_sign_in_params
        devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
      end


    #  def get_users_detail
     #   @user = User.find(params[:user_id])
     # end

      #    def set_user
       #       @user = User.find(params[:id])
        #  end

end