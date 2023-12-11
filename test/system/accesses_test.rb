require "application_system_test_case"

class AccessesTest < ApplicationSystemTestCase
  setup do
    @access = accesses(:one)
  end

  test "visiting the index" do
    visit accesses_url
    assert_selector "h1", text: "Accesses"
  end

  test "should create access" do
    visit accesses_url
    click_on "New access"

    click_on "Create Access"

    assert_text "Access was successfully created"
    click_on "Back"
  end

  test "should update Access" do
    visit access_url(@access)
    click_on "Edit this access", match: :first

    click_on "Update Access"

    assert_text "Access was successfully updated"
    click_on "Back"
  end

  test "should destroy Access" do
    visit access_url(@access)
    click_on "Destroy this access", match: :first

    assert_text "Access was successfully destroyed"
  end
end
