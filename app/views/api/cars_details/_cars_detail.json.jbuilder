json.extract! cars_detail, :id, :Rate, :Avis, :car_id, :created_at, :updated_at
json.url cars_detail_url(cars_detail, format: :json)
