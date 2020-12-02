class PaginatesController < ApplicationController

    require 'open-uri'
    require 'json'


    $pgurl = 'https://bnyonrails.herokuapp.com/api/cars?page='

  
    def prev
      $urlprev = $pgurl + "1"
  
      @cars = JSON.parse(open($urlprev).string)
  
    end
  
    def next
      $urlnext = $pgurl + "2"
  
      @cars = JSON.parse(open($urlnext).string)
  
    end
  end
  