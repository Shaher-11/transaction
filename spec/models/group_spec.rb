require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(username: 'shaher', id: 1) }
  let(:group) { Group.create(name: 'shaher', author_id: user.id, id: 1) }

  it 'should be valid with valid attributes' do
    expect(group).to be_valid
  end

  it 'should be not valid without a username' do
    group.name = ''
    expect(group).to_not be_valid
  end

  it 'should be not valid without a user' do
    group.author_id = nil
    expect(group).to_not be_valid
  end

  it 'checks correct association between user and groups' do
    user.groups.should include(group)
  end
end
