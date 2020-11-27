class CarsDetail < ApplicationRecord
  belongs_to :car , optional: :true
end
