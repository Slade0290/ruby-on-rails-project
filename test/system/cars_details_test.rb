require "application_system_test_case"

class CarsDetailsTest < ApplicationSystemTestCase
  setup do
    @cars_detail = cars_details(:one)
  end

  test "visiting the index" do
    visit cars_details_url
    assert_selector "h1", text: "Cars Details"
  end

  test "creating a Cars detail" do
    visit cars_details_url
    click_on "New Cars Detail"

    fill_in "Avis", with: @cars_detail.Avis
    fill_in "Rate", with: @cars_detail.Rate
    fill_in "Cars", with: @cars_detail.cars_id
    click_on "Create Cars detail"

    assert_text "Cars detail was successfully created"
    click_on "Back"
  end

  test "updating a Cars detail" do
    visit cars_details_url
    click_on "Edit", match: :first

    fill_in "Avis", with: @cars_detail.Avis
    fill_in "Rate", with: @cars_detail.Rate
    fill_in "Cars", with: @cars_detail.cars_id
    click_on "Update Cars detail"

    assert_text "Cars detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Cars detail" do
    visit cars_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cars detail was successfully destroyed"
  end
end
