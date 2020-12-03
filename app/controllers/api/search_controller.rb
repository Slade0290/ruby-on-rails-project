
class Api::SearchController < Api::CarsController
   
    def index
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
                if params[:year].include? "["
                    arr_year = params[:year].tr('[]', '').split(',')                    
                    if arr_year[0].empty? 
                        if !mainQuery.empty?
                            yearQuery = " AND ( cars.year::INTEGER <=" + arr_year[1]
                        else
                            yearQuery = " ( cars.year::INTEGER <=" + arr_year[1]
                        end
                    elsif arr_year.count == 1
                        if !mainQuery.empty?
                            yearQuery = " AND ( cars.year::INTEGER >=" + arr_year[0]
                        else
                            yearQuery = " ( cars.year::INTEGER >=" + arr_year[0]
                        end
                    else
                        if !mainQuery.empty?
                            yearQuery = " AND ( cars.year::INTEGER >="
                        else
                            yearQuery = " ( cars.year::INTEGER >="
                        end
                        yearQuery += " " + arr_year[0] + " AND cars.year::INTEGER <= " + arr_year[1]
                    end
                else
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
                end
                mainQuery += yearQuery + " ) "
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
                if params[:created_at].include? "["
                    arr_created_at = params[:created_at].tr('[]', '').split(',')                    
                    if arr_created_at[0].empty? 
                        if !mainQuery.empty?
                            created_atQuery = " AND ( cars.created_at <= CAST('" + arr_created_at[1] + "' AS DATE) OR cars.created_at::text LIKE '"+ arr_created_at[1] + "%'"
                        else
                            created_atQuery = " ( cars.created_at <= CAST('" + arr_created_at[1] + "' AS DATE) OR cars.created_at::text LIKE '"+ arr_created_at[1] + "%'"
                        end
                    elsif arr_created_at.count == 1
                        if !mainQuery.empty?
                            created_atQuery = " AND ( cars.created_at >= CAST('" + arr_created_at[0] + "' AS DATE) OR cars.created_at::text LIKE '"+ arr_created_at[0] + "%'"
                        else
                            created_atQuery = " ( cars.created_at >= CAST('" + arr_created_at[0] + "' AS DATE) OR cars.created_at::text LIKE '"+ arr_created_at[0] +"%'"
                        end
                    else
                        if !mainQuery.empty?
                            created_atQuery = " AND ( cars.created_at >="
                        else
                            created_atQuery = " ( cars.created_at >="
                        end
                        created_atQuery += " CAST('" + arr_created_at[0] + "' AS DATE)" + " AND cars.created_at <= CAST('" + arr_created_at[1] + "' AS DATE) OR  cars.created_at::text LIKE '"+ arr_created_at[0] +"%' OR cars.created_at::text LIKE '"+ arr_created_at[1] + "%'"
                    end
                else
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
                end
                mainQuery += created_atQuery + ") "
            end
            ######################################################## UPDATED_AT ########################################################
            if !params[:updated_at].nil?                
                if params[:updated_at].include? "["
                    arr_updated_at = params[:updated_at].tr('[]', '').split(',')                    
                    if arr_updated_at[0].empty? 
                        if !mainQuery.empty?
                            updated_atQuery = " AND ( cars.updated_at <= CAST('" + arr_updated_at[1] + "' AS DATE) OR cars.updated_at::text LIKE '"+ arr_updated_at[1] + "%'"
                        else
                            updated_atQuery = " ( cars.updated_at <= CAST('" + arr_updated_at[1] + "' AS DATE) OR cars.updated_at::text LIKE '"+ arr_updated_at[1] + "%'"
                        end
                    elsif arr_updated_at.count == 1
                        if !mainQuery.empty?
                            updated_atQuery = " AND ( cars.updated_at >= CAST('" + arr_updated_at[0] + "' AS DATE) OR cars.updated_at::text LIKE '"+ arr_updated_at[0] + "%'"
                        else
                            updated_atQuery = " ( cars.updated_at >= CAST('" + arr_updated_at[0] + "' AS DATE) OR cars.updated_at::text LIKE '"+ arr_updated_at[0] +"%'"
                        end
                    else
                        if !mainQuery.empty?
                            updated_atQuery = " AND ( cars.updated_at >="
                        else
                            updated_atQuery = " ( cars.updated_at >="
                        end
                        updated_atQuery += " CAST('" + arr_updated_at[0] + "' AS DATE)" + " AND cars.updated_at <= CAST('" + arr_updated_at[1] + "' AS DATE) OR  cars.updated_at::text LIKE '"+ arr_updated_at[0] +"%' OR cars.updated_at::text LIKE '"+ arr_updated_at[1] + "%'"
                    end
                else
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
                end
                mainQuery += updated_atQuery + ") "
            end
            ######################################################## RATE ########################################################
            if !params[:rate].nil?                
                if params[:rate].include? "["
                    arr_rate = params[:rate].tr('[]', '').split(',')                    
                    if arr_rate[0].empty? 
                        if !mainQuery.empty?
                            rateQuery = " AND ( cars.rate::INTEGER <=" + arr_rate[1]
                        else
                            rateQuery = " ( cars.rate::INTEGER <=" + arr_rate[1]
                        end
                    elsif arr_rate.count == 1
                        if !mainQuery.empty?
                            rateQuery = " AND ( cars.rate::INTEGER >=" + arr_rate[0]
                        else
                            rateQuery = " ( cars.rate::INTEGER >=" + arr_rate[0]
                        end
                    else
                        if !mainQuery.empty?
                            rateQuery = " AND ( cars.rate::INTEGER >="
                        else
                            rateQuery = " ( cars.rate::INTEGER >="
                        end
                        rateQuery += " " + arr_rate[0] + " AND cars.rate::INTEGER <= " + arr_rate[1]
                    end
                else
                    if !mainQuery.empty?
                        rateQuery = " AND ( cars.rate ="
                    else
                        rateQuery = " ( cars.rate ="
                    end
                    arr_rate = params[:rate].split(',')
                    i = 1
                    arr_rate.each do |rate|
                        rateQuery += " \'#{rate}\' "
                        i += 1
                        if i < arr_rate.length + 1 
                            rateQuery += "OR cars.rate ="
                        end
                    end
                end
                mainQuery += rateQuery + " ) "
            end
            ######################################################## AVIS ########################################################
            if !params[:avis].nil?
                avisQuery = "( avis ="
                arr_avis = params[:avis].split(',')
                i = 1
                arr_avis.each do |avis|
                    avisQuery += " \'#{avis}\' "
                    i += 1
                    if i < arr_avis.length + 1 
                        avisQuery += "OR avis ="
                    end
                end
                mainQuery = avisQuery + ") "
            end
            @cars = Car.where(mainQuery)
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

end

