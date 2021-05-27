# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(username: 'shaher', id: 1) }
  let(:group) { Group.create(name: 'group', author_id: user.id) }
  let(:expense) { Expense.create(name: 'string', amount: 12, author_id: user.id) }

  it 'should be valid with valid attributes' do
    expect(expense).to be_valid
  end

  it 'should be not valid without a name' do
    expense.name = ''
    expect(expense).to_not be_valid
  end

  it 'should be not valid without a user' do
    expense.author_id = nil
    expect(expense).to_not be_valid
  end

  it 'should check the correct association between user and expense' do
    user.expenses.should include(expense)
  end
end