
class Api::CarsController < Api::BaseController
   
    #before_action :set_car, only: [:show, :update]
skip_before_action :verify_authenticity_token , only: [:create, :update, :show , :edit]
    swagger_controller :CarsRessources, "Cars Management"

    def index
        #@cars = Car.page(params[:page])

        @cars = Car.page(params[:page]).per(5)

        render json: @cars,
               meta: {
                 pagination: {
                   per_page: 5,
                   total_pages: 10,
                   total_objects: 150
                 }
               }
        @cars = policy_scope(Car)
    end

    
    def create
        # @cars = policy_scope(Car)
        @car = Car.new(car_params)

        if @car.save
             head(:ok)
            # redirect_to @car
        else
           head(:failed)
           render json: @car , status: :failed
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

  # PATCH/PUT /cars_details/1
  # PATCH/PUT /cars_details/1.json
  def update

     @car = Car.find(params[:id])

      if @car.update(car_params)
        head(:ok)
        #format.json { render json: @car }

      else
        format.html { render :edit }
        format.json { render json: @cars.errors, status: :unprocessable_entity }
      end
    end


    def show
        # @cars = policy_scope(Car)
        @car = Car.find(params[:id])

        # redirect_to @api_car
        # @authorize @car
    end

    def set_car
        @car = Car.find(params[:id])
    end

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

   swagger_api :update do |api|
    summary "Update a car"
    param :path, :id, :integer, :required, "Property ID"
    response :unauthorized
    response :not_found
    end

   swagger_api :destroy do |api|
       summary "Destroy an existing car"
       param :path, :id, :integer, :required, "Property ID"
       response :unauthorized
       response :not_found
   end
 

end

