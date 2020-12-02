class CarsController < ApplicationController

  require 'open-uri'
  require 'json'

  $url = 'http://localhost:3000/api/cars/'

  def index
    @cars = JSON.parse(open($url).string)
  end

  def show 
    @car = JSON.parse(open($url + params[:id]).string)
  end
  
  def edit 
    @car = JSON.parse(open($url + params[:id]).string)
  end

  def prev
    $urlprev = 'http://localhost:3000/api/cars?page=1'

    @cars = JSON.parse(open($urlprev).string)

  end

  def next
    $urlnext = 'http://localhost:3000/api/cars?page=2'

    @cars = JSON.parse(open($urlnext).string)

  end
end
