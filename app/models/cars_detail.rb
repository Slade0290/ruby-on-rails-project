class CarsDetail < ApplicationRecord
  belongs_to :cars , optional: :true
end
