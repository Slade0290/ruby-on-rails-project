# Swagger::Docs::Config.base_api_controller = ActionController::API
Swagger::Docs::Config.register_apis({
    "1.0" => {:controller_base_path => "", :api_file_path => "public"}
  })

# Swagger::Docs::Config.register_apis({
#     "1.0" => {
#       # the extension used for the API
#       :api_extension_type => :json,
#       # the output location where your .json files are written to
#       :api_file_path => "/public",
#       # the URL base path to your API
#       :base_path => "http://localhost:3000/swagger/",
#       # if you want to delete all .json files at each generation
#       :clean_directory => false,
#       # Ability to setup base controller for each api version. Api::V1::SomeController for example.
#       :parent_controller => Api::CarsController,
#       # add custom attributes to api-docs
#       :attributes => {
#         :info => {
#           "title" => "Swagger Sample App",
#           "description" => "This is our app description.",
#           "termsOfServiceUrl" => "http://test.com/terms/",
#           "contact" => "test@ynov.com",
#           "license" => "Apache 2.0",
#           "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
#         }
#       }
#     }
#   })