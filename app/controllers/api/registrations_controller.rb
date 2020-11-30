class Api::RegistrationsController < Api::BaseController

def create
        @user = User.new(user_params)
        if @user.save
             head(:ok)
             session[:user_authenticity_token] = @user.authentication_token
             #format.json { render json: @users.email, status: :created }
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

end
