class ApplicationController < ActionController::Base
    
    before_action :authenticate_user!
    
    acts_as_token_authentication_handler_for User

    include Pundit
    
    after_action :verify_authorized, expect: :index, unless: :skip_pundit?  
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?  

    def skip_pundit?
        devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end

    def home
        render 'layouts/home'
    end
end
