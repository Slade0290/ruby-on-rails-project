
class Swagger::CarsController < Swagger::BaseController

#  include Swagger::Docs::Methods

swagger_controller :cars, "Car Management"

#  def self.add_common_params(api)
#      api.param :form, "car[brand]", :string, :optional, "brand"
#      api.param :form, "car[model]", :string, :optional, "model"
#      api.param :form, "car[year]", :string, :optional, "year"
#    end

   swagger_api :swhow do |api|
    summary "Fetches all cars"
    param :path, :id, :integer, :required, "Property ID"
    response :unauthorized
    response :not_acceptable
   end
 
   def show
    render :json => {result:"Success"}, :status => 200
   end
end
