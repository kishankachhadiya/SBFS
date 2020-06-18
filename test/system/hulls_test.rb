require "application_system_test_case"

class HullsTest < ApplicationSystemTestCase
  setup do
    @hull = hulls(:one)
  end

  test "visiting the index" do
    visit hulls_url
    assert_selector "h1", text: "Hulls"
  end

  test "creating a Hull" do
    visit hulls_url
    click_on "New Hull"

    fill_in "Hull", with: @hull.hull
    click_on "Create Hull"

    assert_text "Hull was successfully created"
    click_on "Back"
  end

  test "updating a Hull" do
    visit hulls_url
    click_on "Edit", match: :first

    fill_in "Hull", with: @hull.hull
    click_on "Update Hull"

    assert_text "Hull was successfully updated"
    click_on "Back"
  end

  test "destroying a Hull" do
    visit hulls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hull was successfully destroyed"
  end
end
