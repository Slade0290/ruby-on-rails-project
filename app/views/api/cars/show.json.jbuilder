json.car do
    json.brand @car.brand
    json.model @car.model
    json.year  @car.year
 end


# json.set! :car do
#     json.set! :brand, 'David'
#   end

# json.array! @car, :brand, :model