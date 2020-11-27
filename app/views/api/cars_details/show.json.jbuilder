# json.partial! "cars_details/cars_detail", cars_detail: @cars_detail

json.cars_detail do
    raise
    json.rate @cars_detail.rate
    json.avis @cars_detail.avis
    json.car_id  @cars_detail.car_id
end
