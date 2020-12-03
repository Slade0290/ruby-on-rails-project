class Api::BaseController < ActionController::Base

    #before_action :authenticate_user!
    #acts_as_token_authentication_handler_for User

    protect_from_forgery with: :null_session

    include Pundit
    
    after_action :verify_authorized, except: [:home, :index, :create, :new, :destroy, :show, :update, :edit], unless: :skip_pundit?  
    after_action :verify_policy_scoped, only: :destroy, unless: :skip_pundit?  
    
    # helper_method :current_user
    
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found
    
    def skip_pundit?
        devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end
    
    # private
    
    # def user_not_authorized(exception)
    
    #     render json: {
    #         error: exception.message
    #     },status: :unhautorized
    # end    
    
    # def not_found(exception)
    
    #     render json: {error: exception.message},status: :not_found
    
    # end    
    
    
    
    end
    
