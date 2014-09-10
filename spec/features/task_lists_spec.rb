require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view task lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario 'User can add a task list' do
    create_user email: "user@example.com"

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "+ Add Task List"
    fill_in "Name", with: "Harleigh's Dog Tasks"
    click_on "Create Task List"
    expect(page).to have_content "Task List was created successfully"
    expect(page).to have_content "Harleigh's Dog Tasks"
  end

  scenario 'User cannot add a task list without a title' do
    create_user email: "user@example.com"

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "+ Add Task List"
    click_on "Create Task List"

    expect(page).to have_content("Your task list could not be created")
  end

  scenario 'User can edit a task list' do
    create_user email: "user@example.com"

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "+ Add Task List"
    fill_in "Name", with: "Harleigh Bear's Tasks"
    click_on "Create Task List"

    click_on "Edit"
    #expect(page).to have_content "Harleigh Bear's Tasks"
    fill_in "Name", with: "Harleigh's updated task list"
    click_on "Edit Task List"
    expect(page).to have_content "Harleigh's updated task list"
  end

  scenario 'User can delete a task list' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Harleigh's List")
    TaskList.create!(name: "Kinsey")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    within("section", :text => "Kinsey") do
      click_on "Delete Task List"
    end

    expect(page).to have_content("Harleigh's List")
    expect(page).to_not have_content("Kinsey")
  end

  scenario 'User can view completed tasks for a task list' do
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
    fill_in "Description", with: "Pick up dog poop"
    click_on "Create Task"

    within("section", :text => "HarHoo List") do
      click_on "Complete"
    end

    click_on "Completed Tasks"
    expect(page).to have_content("Completed Tasks")
    expect(page).to have_content("Pick up dog poop")
  end
end