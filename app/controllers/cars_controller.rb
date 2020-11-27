class CarsController < ApplicationController

  require 'open-uri'
  require 'json'

  def show
    @cars = JSON.parse(open('https://bnyonrails.herokuapp.com/api/cars').string)
    
    # response = URI.open("https://bnyonrails.herokuapp.com/api/cars") {|f|
    #   f.each_line {|line| p line}
    # }
    # puts "\n\n#{response}\n\n"
    # puts "\n\n#{response[0]}\n\n"
    # my_hash = JSON.parse(response[0])
    # response.each {

    # }
  end
end
