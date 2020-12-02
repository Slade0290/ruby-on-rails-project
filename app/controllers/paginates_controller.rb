class PaginatesController < ApplicationController

    require 'open-uri'
    require 'json'
  
    def prev
      $urlprev = 'http://localhost:3000/api/cars?page=1'
  
      @cars = JSON.parse(open($urlprev).string)
  
    end
  
    def next
      $urlnext = 'http://localhost:3000/api/cars?page=2'
  
      @cars = JSON.parse(open($urlnext).string)
  
    end
  end
  