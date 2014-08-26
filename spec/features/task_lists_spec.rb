require 'rails_helper'

feature 'Task lists' do
  def signin
    create_user email: "user@example.com"

    visit signin_path

    click_on "Login"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"

    click_on "Login"
  end

  scenario 'User can view task lists' do
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    signin

    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario "user can add a task list" do
    signin

    click_on "Add Task List"

    fill_in "Name", :with => "Some new task list"
    click_on "Create Task List" 
    
    expect(page).to have_content("Task List was created successfully")
    expect(page).to have_content("Some new task list")
  end

end