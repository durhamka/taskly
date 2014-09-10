require 'rails_helper'
require 'capybara/rails'

feature 'Tasks' do
  scenario 'User can add a task' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")
    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    within("section", :text => "Work List") do
      click_on "+ Add Task"
    end
    fill_in "Description", with: "Take Harleigh to the park"
    select('2014', :from => 'task_due_date_1i')
    select('April', :from => 'task_due_date_2i')
    select('28', :from => 'task_due_date_3i')
    click_on "Create Task"

    expect(page).to have_content "Task was created successfully!"
    expect(page).to have_content "Take Harleigh to the park"
    expect(page).to have_content "2014"
    expect(page).to have_content "04"
    expect(page).to have_content "28"
  end

  scenario 'User cannot add a task without a description' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    within("section", :text => "Work List") do
      click_on "+ Add Task"
    end
    click_on "Create Task"
    expect(page).to have_content("Your task could not be created")
  end

  scenario 'User can delete a task' do
    create_user email: "user@example.com"
    TaskList.create!(name: "HarHoo List")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    within("section", :text => "HarHoo List") do
      click_on "+ Add Task"
    end
    fill_in "Description", with: "Clean up toys"
    click_on "Create Task"

    within("section", :text => "HarHoo List") do
      click_on "Delete"
    end
    expect(page).to_not have_content("Clean up toys")
    expect(page).to have_content("Task was deleted successfully")
  end

  scenario 'User can complete a task' do
    create_user email: "user@example.com"
    TaskList.create!(name: "HarHoo List")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    within("section", :text => "HarHoo List") do
      click_on "+ Add Task"
    end
    fill_in "Description", with: "Clean up toys"
    click_on "Create Task"

    within("section", :text => "HarHoo List") do
      click_on "Complete"
    end

    expect(page).to_not have_content("Clean up toys")
    expect(page).to have_content("Task was completed successfully")
  end
end