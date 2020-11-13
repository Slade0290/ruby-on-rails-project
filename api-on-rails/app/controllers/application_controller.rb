class ApplicationController < ActionController::Base

    acts_as_token_authentication_handler_for User


    def home
        render 'layouts/home'
    end
end
