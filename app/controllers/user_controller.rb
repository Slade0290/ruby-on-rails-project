class UserController < ApplicationController
  
  $sessionurl = 'https://bnyonrails.herokuapp.com/api/sessions'

  $registrationurl = ' https://bnyonrails.herokuapp.com/api/registrations'

  def create
    # call api with data to create user in back

   # @user = JSON.parse(open($registrationurl + params[:email , :password]).string)
  end

  def signup 

    #@user = JSON.parse(open($sessionurl + params[:email]).string)
    # @user = JSON.parse(open($url + params[:id]).string)
    
  end


  def login
   
  end

end
