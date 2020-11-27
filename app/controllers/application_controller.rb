class ApplicationController < ActionController::Base
    

    include Pundit

    after_action :verify_authorized, except: [:home, :index, :create, :new, :destroy, :show, :update, :edit], unless: :skip_pundit?  
    after_action :verify_policy_scoped, only: :destroy, unless: :skip_pundit?  

    def skip_pundit?
        devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end

    def home
        render 'layouts/home'
    end
end
