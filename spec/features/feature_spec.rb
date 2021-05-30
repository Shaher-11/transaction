require 'rails_helper'

feature 'Accessing Application' do
  background do
    User.create(username: 'shaher')
    Group.create(name: 'shoppings', author_id: 1)
    Expense.create(name: 'Phone', amount: 500, author_id: 1)
    Expense.create(name: 'Tablet', amount: 400, author_id: 1)
    ExpenseGroup.create(expense_id: 1, group_id: 1)
  end

  scenario 'User is Signing in with correct credentials' do
    visit '/login'
    fill_in 'username', with: 'shaher'
    click_button 'Log in'
    expect(page).to have_content 'Welcome shaher'
    expect(page).to have_current_path(root_path)
    expect(page).to_not have_current_path('/login')
  end
end

feature 'User is Navigating through the application' do
  background do
    User.create(username: 'shaher')
    Group.create(name: 'shoppings', author_id: 1)
    Expense.create(name: 'Phone', amount: 500, author_id: 1)
    Expense.create(name: 'Tablet', amount: 400, author_id: 1)
    ExpenseGroup.create(expense_id: 1, group_id: 1)
  end

  scenario 'user is presented with a his own profile page' do
    visit '/login'
    fill_in 'username', with: 'shaher'
    click_button 'Log in'
    expect(page).to have_content 'Groups'
    expect(page).to have_content 'Expenses'
    expect(page).to have_content 'External Expenses'
    expect(page).to_not have_content 'Log in'
    expect(page).to_not have_content 'Sign Up'
  end

  scenario 'user opens External expenses page' do
    visit '/login'
    fill_in 'Username', with: 'shaher'
    click_button 'Log in'
    click_link 'External Expenses'
    expect(page).to have_content '400'
    expect(page).to have_content 'Tablet'
    expect(page).to have_content 'Add Expense'
    expect(page).to_not have_current_path('/login')
  end
end

feature 'Creating New groups and expenses' do
  background do
    User.create(username: 'shaher')
  end

  scenario 'user opens and Creates New Group page' do
    visit '/login'
    fill_in 'Username', with: 'shaher'
    click_button 'Log in'
    click_link 'Groups'
    click_link 'New Group'
    expect(page).to have_current_path('/groups/new')
    expect(page).to have_content 'Create Transaction Group'
    click_button 'Create'
    expect(page).to_not have_current_path('/login')
    expect(page).to have_current_path('/groups')
  end

  scenario 'user opens to add a new expense' do
    visit '/login'
    fill_in 'Username', with: 'shaher'
    click_button 'Log in'
    click_link 'Expenses'
    click_link 'New Expense'
    expect(page).to have_current_path('/expenses/new')
    expect(page).to have_current_path('/expenses/new')
    expect(page).to_not have_current_path('/login')
  end
end
