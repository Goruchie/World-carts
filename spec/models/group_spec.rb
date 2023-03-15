require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(email: 'guy@gmail.com', name: 'asd', password: '111111', password_confirmation: '111111')
    @group = Group.create(user_id: @user.id, name: 'Group 1')
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon should be nil' do
    @group.icon = nil
    expect(@group).to be_valid
  end

  it 'should have a valid user' do
    expect(@group.user).to eq(@user)
  end

  it 'should belong to a user' do
    expect(@user.groups).to include(@group)
  end
end
