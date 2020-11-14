
json.array! @cars do |car|
    
    json.extract! car, :id, :brand , :model , :year
end