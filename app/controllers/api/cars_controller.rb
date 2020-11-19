
class Api::CarsController < Api::BaseController
   
    # before_action :set_car, only: [:show, :update, :index]

    swagger_controller :CarsRessources, "Cars Management"

    def index
        # @cars = Car.all
        if params.nil?
            @cars = policy_scope(Car)
        else
            mainQuery = ""
            ######################################################## BRAND ########################################################
            if !params[:brand].nil?
                brandQuery = "( brand ="
                arr_brand = params[:brand].split(',')
                i = 1
                arr_brand.each do |brand|
                    brandQuery += " \'#{brand}\' "
                    i += 1
                    if i < arr_brand.length + 1 
                        brandQuery += "OR brand ="
                    end
                end
                mainQuery = brandQuery + ") "
            end
            ######################################################## YEAR ########################################################
            if !params[:year].nil?
                if !mainQuery.empty?
                    yearQuery = " AND ( cars.year ="
                else 
                    yearQuery = " ( cars.year ="
                end
                arr_year = params[:year].split(',')
                i = 1
                arr_year.each do |year|
                    yearQuery += " \'#{year}\' "
                    i += 1
                    if i < arr_year.length + 1 
                        yearQuery += "OR cars.year ="
                    end
                end
                mainQuery += yearQuery + ") "
            end
            ######################################################## MODEL ########################################################
            if !params[:model].nil?
                if !mainQuery.empty?
                    modelQuery = " AND ( cars.model ="
                else 
                    modelQuery = " ( cars.model ="
                end
                arr_model = params[:model].split(',')
                i = 1
                arr_model.each do |model|
                    modelQuery += " \'#{model}\' "
                    i += 1
                    if i < arr_model.length + 1 
                        modelQuery += "OR model ="
                    end
                end
                mainQuery += modelQuery + ") "
            end
            ######################################################## CREATED_AT ########################################################
            if !params[:created_at].nil?
                if !mainQuery.empty?
                    created_atQuery = " AND ( cars.created_at::text LIKE"
                else 
                    created_atQuery = " ( cars.created_at::text LIKE"
                end
                arr_created_at = params[:created_at].split(',')
                i = 1
                arr_created_at.each do |created_at|
                    created_atQuery += " \'#{created_at}%\' "
                    i += 1
                    if i < arr_created_at.length + 1 
                        created_atQuery += "OR created_at::text LIKE"
                    end
                end
                mainQuery += created_atQuery + ") "
            end
            ######################################################## UPDATED_AT ########################################################
            if !params[:updated_at].nil?
                if !mainQuery.empty?
                    updated_atQuery = " AND ( cars.updated_at::text LIKE"
                else 
                    updated_atQuery = " ( cars.updated_at::text LIKE"
                end
                arr_updated_at = params[:updated_at].split(',')
                i = 1
                arr_updated_at.each do |updated_at|
                    updated_atQuery += " \'#{updated_at}%\' "
                    i += 1
                    if i < arr_updated_at.length + 1 
                        updated_atQuery += "OR updated_at::text LIKE"
                    end
                end
                mainQuery += updated_atQuery + ") "
            end
            @cars = Car.where(mainQuery)
        end
    end

    def create
        # @cars = policy_scope(Car)
        @car = Car.new(car_params)

        if @car.save
            #  head(:ok)
            redirect_to @car
        else
            head(:failed) 
            # render json: @car , status: :failed 
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