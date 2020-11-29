class UserController < ApplicationController
  
  $url = 'https://bnyonrails.herokuapp.com/api/user/'

  def create
    # call api with data to create user in back
  end

  def show 
    # @user = JSON.parse(open($url + params[:id]).string)
    
  end

end
