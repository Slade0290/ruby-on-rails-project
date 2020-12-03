# json.partial! "cars_details/cars_detail", cars_detail: @cars_detail

json.cars_detail do
    json.rate @cars_detail.Rate
    json.avis @cars_detail.Avis
    # json.car_id  @cars_detail.car_id
end
