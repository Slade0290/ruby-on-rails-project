# require 'test_helper'

# class CarsDetailsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @cars_detail = cars_details(:one)
#   end

#   test "should get index" do
#     get cars_details_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_cars_detail_url
#     assert_response :success
#   end

#   test "should create cars_detail" do
#     assert_difference('CarsDetail.count') do
#       post cars_details_url, params: { cars_detail: { Avis: @cars_detail.Avis, Rate: @cars_detail.Rate, cars_id: @cars_detail.cars_id } }
#     end

#     assert_redirected_to cars_detail_url(CarsDetail.last)
#   end

#   test "should show cars_detail" do
#     get cars_detail_url(@cars_detail)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_cars_detail_url(@cars_detail)
#     assert_response :success
#   end

#   test "should update cars_detail" do
#     patch cars_detail_url(@cars_detail), params: { cars_detail: { Avis: @cars_detail.Avis, Rate: @cars_detail.Rate, cars_id: @cars_detail.cars_id } }
#     assert_redirected_to cars_detail_url(@cars_detail)
#   end

#   test "should destroy cars_detail" do
#     assert_difference('CarsDetail.count', -1) do
#       delete cars_detail_url(@cars_detail)
#     end

#     assert_redirected_to cars_details_url
#   end
# end
