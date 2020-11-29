class CarsController < ApplicationController

  require 'open-uri'
  require 'json'

  $url = 'https://bnyonrails.herokuapp.com/api/cars/'

  def index
    @cars = JSON.parse(open($url).string)
  end

  def show 
    @car = JSON.parse(open($url + params[:id]).string)
  end
  
  def edit 
    @car = JSON.parse(open($url + params[:id]).string)
  end
end
