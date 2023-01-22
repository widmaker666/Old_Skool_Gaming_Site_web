require "application_system_test_case"

class ThecommentsTest < ApplicationSystemTestCase
  setup do
    @thecomment = thecomments(:one)
  end

  test "visiting the index" do
    visit thecomments_url
    assert_selector "h1", text: "Thecomments"
  end

  test "should create thecomment" do
    visit thecomments_url
    click_on "New thecomment"

    click_on "Create Thecomment"

    assert_text "Thecomment was successfully created"
    click_on "Back"
  end

  test "should update Thecomment" do
    visit thecomment_url(@thecomment)
    click_on "Edit this thecomment", match: :first

    click_on "Update Thecomment"

    assert_text "Thecomment was successfully updated"
    click_on "Back"
  end

  test "should destroy Thecomment" do
    visit thecomment_url(@thecomment)
    click_on "Destroy this thecomment", match: :first

    assert_text "Thecomment was successfully destroyed"
  end
end
