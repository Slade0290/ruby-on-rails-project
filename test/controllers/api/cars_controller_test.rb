
require 'test_helper'

module Api 

    class CarsControllerTest < ActionDispatch::IntegrationTest


    setup do
        user = users(:one)
  
        @header = {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token

        }
      end

      test 'fetch cars' do
        # not_user_one_account = accounts(:another_one)
  
        get api_cars_path
  
        # cars = JSON.parse(@response.body)['data']
        
        assert_response :success
      end


    # test 'creates account for user' do
    #     # account_params =  {
    #     #     email: "aros@aros",
    #     #     encrypted_password: "testest",

    #     #   }

    #     #   get api_sessions_path, headers: @header

        
    #      post(
    #     api_sessions_path,
    #     #   headers: @header,
    #       params: {email: "aros@aros" , password: "testest"}
    #     )
  
    #     account = JSON.parse(@response.body)['data']
  
    #     assert_response :success
  
    #   end

    end 
end