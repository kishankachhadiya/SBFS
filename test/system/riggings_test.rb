require "application_system_test_case"

class RiggingsTest < ApplicationSystemTestCase
  setup do
    @rigging = riggings(:one)
  end

  test "visiting the index" do
    visit riggings_url
    assert_selector "h1", text: "Riggings"
  end

  test "creating a Rigging" do
    visit riggings_url
    click_on "New Rigging"

    fill_in "Rigging", with: @rigging.rigging
    click_on "Create Rigging"

    assert_text "Rigging was successfully created"
    click_on "Back"
  end

  test "updating a Rigging" do
    visit riggings_url
    click_on "Edit", match: :first

    fill_in "Rigging", with: @rigging.rigging
    click_on "Update Rigging"

    assert_text "Rigging was successfully updated"
    click_on "Back"
  end

  test "destroying a Rigging" do
    visit riggings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rigging was successfully destroyed"
  end
end
