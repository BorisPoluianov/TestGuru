require "application_system_test_case"

class TestProgressesTest < ApplicationSystemTestCase
  setup do
    @test_progress = test_progresses(:one)
  end

  test "visiting the index" do
    visit test_progresses_url
    assert_selector "h1", text: "Test Progresses"
  end

  test "creating a Test progress" do
    visit test_progresses_url
    click_on "New Test Progress"

    click_on "Create Test progress"

    assert_text "Test progress was successfully created"
    click_on "Back"
  end

  test "updating a Test progress" do
    visit test_progresses_url
    click_on "Edit", match: :first

    click_on "Update Test progress"

    assert_text "Test progress was successfully updated"
    click_on "Back"
  end

  test "destroying a Test progress" do
    visit test_progresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test progress was successfully destroyed"
  end
end
