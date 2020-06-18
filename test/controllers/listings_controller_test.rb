require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { beam: @listing.beam, berths: @listing.berths, cabins: @listing.cabins, description: @listing.description, displacement: @listing.displacement, draft: @listing.draft, email: @listing.email, engine: @listing.engine, equipment: @listing.equipment, fuel: @listing.fuel, horsepower: @listing.horsepower, hours: @listing.hours, length: @listing.length, location: @listing.location, model: @listing.model, phone_number: @listing.phone_number, public_name: @listing.public_name, published: @listing.published, title: @listing.title, year: @listing.year, zip_code: @listing.zip_code } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { beam: @listing.beam, berths: @listing.berths, cabins: @listing.cabins, description: @listing.description, displacement: @listing.displacement, draft: @listing.draft, email: @listing.email, engine: @listing.engine, equipment: @listing.equipment, fuel: @listing.fuel, horsepower: @listing.horsepower, hours: @listing.hours, length: @listing.length, location: @listing.location, model: @listing.model, phone_number: @listing.phone_number, public_name: @listing.public_name, published: @listing.published, title: @listing.title, year: @listing.year, zip_code: @listing.zip_code } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
