require "application_system_test_case"

class ListingsTest < ApplicationSystemTestCase
  setup do
    @listing = listings(:one)
  end

  test "visiting the index" do
    visit listings_url
    assert_selector "h1", text: "Listings"
  end

  test "creating a Listing" do
    visit listings_url
    click_on "New Listing"

    fill_in "Beam", with: @listing.beam
    fill_in "Berths", with: @listing.berths
    fill_in "Cabins", with: @listing.cabins
    fill_in "Description", with: @listing.description
    fill_in "Displacement", with: @listing.displacement
    fill_in "Draft", with: @listing.draft
    fill_in "Email", with: @listing.email
    fill_in "Engine", with: @listing.engine
    fill_in "Equipment", with: @listing.equipment
    fill_in "Fuel", with: @listing.fuel
    fill_in "Horsepower", with: @listing.horsepower
    fill_in "Hours", with: @listing.hours
    fill_in "Length", with: @listing.length
    fill_in "Location", with: @listing.location
    fill_in "Model", with: @listing.model
    fill_in "Phone number", with: @listing.phone_number
    fill_in "Public name", with: @listing.public_name
    fill_in "Published", with: @listing.published
    fill_in "Title", with: @listing.title
    fill_in "Year", with: @listing.year
    fill_in "Zip code", with: @listing.zip_code
    click_on "Create Listing"

    assert_text "Listing was successfully created"
    click_on "Back"
  end

  test "updating a Listing" do
    visit listings_url
    click_on "Edit", match: :first

    fill_in "Beam", with: @listing.beam
    fill_in "Berths", with: @listing.berths
    fill_in "Cabins", with: @listing.cabins
    fill_in "Description", with: @listing.description
    fill_in "Displacement", with: @listing.displacement
    fill_in "Draft", with: @listing.draft
    fill_in "Email", with: @listing.email
    fill_in "Engine", with: @listing.engine
    fill_in "Equipment", with: @listing.equipment
    fill_in "Fuel", with: @listing.fuel
    fill_in "Horsepower", with: @listing.horsepower
    fill_in "Hours", with: @listing.hours
    fill_in "Length", with: @listing.length
    fill_in "Location", with: @listing.location
    fill_in "Model", with: @listing.model
    fill_in "Phone number", with: @listing.phone_number
    fill_in "Public name", with: @listing.public_name
    fill_in "Published", with: @listing.published
    fill_in "Title", with: @listing.title
    fill_in "Year", with: @listing.year
    fill_in "Zip code", with: @listing.zip_code
    click_on "Update Listing"

    assert_text "Listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Listing" do
    visit listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Listing was successfully destroyed"
  end
end
