class Api::RegistrationsController < Api::BaseController


  swagger_controller :RegistrationsRessources, "Registrations Management"


def create
        @user = User.new(user_params)
        if @user.save
             head(:ok)
             session[:user_authenticity_token] = @user.authentication_token
             #format.json { render json: @users.email, status: :created }
            #  render plain: '200 Success', status: :ok

        else
          # render json: @user , status: :failed
          head(:unauthorized)
        end
# @user = User.where(email: params[:email]).first
# if @user.valid_password?(params[:password]   session[:user_authenticity_token] = @user.authenticity_token    render json: user.as_json(only: [:email]) , status: :created    else        head (:unauthorized)  end
end

    def user_params
        params.require(:user).permit(:email, :password)
    end


    def self.add_common_params(api)
      api.param :form, "user[email]", :string, :optional, "email"
      api.param :form, "user[password]", :string, :optional, "password"
  end

 
 swagger_api :create do |api|
     summary "Create a user"
     Api::CarsController::add_common_params(api)
     response :success
     response :unauthorized
 end

end
