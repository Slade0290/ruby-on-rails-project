
class Api::CarsController < Api::BaseController
   
    # before_action :set_car, only: [:show, :update, :index]

    include Sift

    filter_on :model, type: :string
    filter_on :brand, type: :string
    filter_on :year, type: :int
    filter_on :created_at, type: :date
    filter_on :updated_at, type: :date

    swagger_controller :CarsRessources, "Cars Management"

    def index
        @cars = Car.all
        
        @cars = policy_scope(Car)
        raise
        
        Car.where(brand:) 
        # Active Record & IF
        # @cars = @cars.joins(:manufacturers).where("manufacturers.name LIKE ?", "%#{​​​​​params[:manufacturer].parameterize}​​​​​%")
        # Roll back before commit & do it à la main, voir active record et la ligne du dessus pour les dates
        # on récup les params de l'url dans params et on fait un where
    end

    def create
    # @cars = policy_scope(Car)

    @car = Car.new(car_params)

     if @car.save
      #  head(:ok)
        redirect_to @car
     else
        head(:failed) 
    #   render json: @car , status: :failed 
     end

    end  
    
    def destroy

        # @cars = policy_scope(Car)
        @car = Car.where( id: params[:id]).first

       if @car.destroy
        
        head(:ok)
        
       else
        
        head(:failed)
       end 

    end

    def show
        # @cars = policy_scope(Car)
        @car = Car.find(params[:id])

        redirect_to @car
        # @authorize @car
    end

    # def set_car
    #     @car = Car.find(params[:id])
    #   end

    def car_params
        params.require(:car).permit(:brand, :model, :year)
    end

    def self.add_common_params(api)
        api.param :form, "car[brand]", :string, :optional, "brand"
        api.param :form, "car[model]", :string, :optional, "model"
        api.param :form, "car[year]", :string, :optional, "year"
    end

    swagger_api :index do |api|
        summary "Fetches all cars"
        response :unauthorized
        response :not_acceptable
    end
   
   swagger_api :create do |api|
       summary "Create a new car item"
       Api::CarsController::add_common_params(api)
       response :unauthorized
       response :not_acceptable
       response :unprocessable_entity
   end
    
   swagger_api :show do |api|
    summary "Fetch a car"
    param :path, :id, :integer, :required, "Property ID"
    response :unauthorized
    response :not_acceptable
   end

   swagger_api :destroy do |api|
       summary "Destroy an existing car"
       param :path, :id, :integer, :required, "Property ID"
       response :unauthorized
       response :not_found
   end
 
  
end