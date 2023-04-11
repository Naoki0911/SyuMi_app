require "application_system_test_case"

class SakesTest < ApplicationSystemTestCase
  setup do
    @sake = sakes(:one)
  end

  test "visiting the index" do
    visit sakes_url
    assert_selector "h1", text: "Sakes"
  end

  test "creating a Sake" do
    visit sakes_url
    click_on "New Sake"

    fill_in "Content", with: @sake.content
    fill_in "Feeling", with: @sake.feeling
    fill_in "Flavor", with: @sake.flavor
    fill_in "Name", with: @sake.name
    fill_in "Place", with: @sake.place
    fill_in "Rich", with: @sake.rich
    fill_in "Sour", with: @sake.sour
    fill_in "Sweetness", with: @sake.sweetness
    fill_in "User", with: @sake.user_id
    click_on "Create Sake"

    assert_text "Sake was successfully created"
    click_on "Back"
  end

  test "updating a Sake" do
    visit sakes_url
    click_on "Edit", match: :first

    fill_in "Content", with: @sake.content
    fill_in "Feeling", with: @sake.feeling
    fill_in "Flavor", with: @sake.flavor
    fill_in "Name", with: @sake.name
    fill_in "Place", with: @sake.place
    fill_in "Rich", with: @sake.rich
    fill_in "Sour", with: @sake.sour
    fill_in "Sweetness", with: @sake.sweetness
    fill_in "User", with: @sake.user_id
    click_on "Update Sake"

    assert_text "Sake was successfully updated"
    click_on "Back"
  end

  test "destroying a Sake" do
    visit sakes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sake was successfully destroyed"
  end
end
