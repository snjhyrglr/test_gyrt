require "application_system_test_case"

class AgentsTest < ApplicationSystemTestCase
  setup do
    @agent = agents(:one)
  end

  test "visiting the index" do
    visit agents_url
    assert_selector "h1", text: "Agents"
  end

  test "should create agent" do
    visit agents_url
    click_on "New agent"

    fill_in "Birthdate", with: @agent.birthdate
    fill_in "First name", with: @agent.first_name
    fill_in "Last name", with: @agent.last_name
    fill_in "Middle name", with: @agent.middle_name
    fill_in "Suffix", with: @agent.suffix
    fill_in "Username", with: @agent.username
    click_on "Create Agent"

    assert_text "Agent was successfully created"
    click_on "Back"
  end

  test "should update Agent" do
    visit agent_url(@agent)
    click_on "Edit this agent", match: :first

    fill_in "Birthdate", with: @agent.birthdate
    fill_in "First name", with: @agent.first_name
    fill_in "Last name", with: @agent.last_name
    fill_in "Middle name", with: @agent.middle_name
    fill_in "Suffix", with: @agent.suffix
    fill_in "Username", with: @agent.username
    click_on "Update Agent"

    assert_text "Agent was successfully updated"
    click_on "Back"
  end

  test "should destroy Agent" do
    visit agent_url(@agent)
    click_on "Destroy this agent", match: :first

    assert_text "Agent was successfully destroyed"
  end
end
