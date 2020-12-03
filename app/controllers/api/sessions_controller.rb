class Api::SessionsController < Api::BaseController


 # before_action :set_user

 # before_action :get_users_detail

skip_before_action :verify_authenticity_token

#before_action :authenticate_user! , only: :create

protect_from_forgery with: :null_session

swagger_controller :SessionsRessources, "Sessions Management"


def create
# super
   @user = User.where(email: params[:email]).first

    if @user.valid_password?(params[:password])
        session[:user_authenticity_token] = @user.authentication_token
        head(:ok) 
        # render plain: '200 Success', status: :ok

        # render nothing: true, status: 200
    else
        head(:not_found)
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

        def self.add_common_params(api)
            api.param :form, "email", :string, :optional, "email"
            api.param :form, "password", :string, :optional, "password"
        end
    
       
       swagger_api :create do |api|
           summary "Create a session"
           Api::CarsController::add_common_params(api)
           response :success
           response :not_found
       end
        
    
    #    swagger_api :destroy do |api|
    #        summary "Destroy session"
    #        param :path, :id, :integer, :required, "Property ID"
    #        response :unauthorized
    #        response :not_found
    #    end

end