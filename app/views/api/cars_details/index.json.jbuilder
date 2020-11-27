# raise
json.array! @cars_details do |carDetail|
    # raise
    json.extract! carDetail, :cars_id, :Rate , :Avis
end

# json.cars_detail do
#     json.rate 
#     json.avis 
#     json.car_id 
# end


