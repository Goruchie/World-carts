require 'rails_helper'

RSpec.describe Entity, type: :model do
  before do
    @user = User.create(name: 'Tom', email: 'tom@yopmail.com', password: 'password')
    @group = Group.create(user_id: @user.id, name: 'Group 1')
    @entity = Entity.create(name: 'Entity 1', amount: 3.1, user_id: @user.id, group_id: @group.id)
    @entity.save
  end

  it 'name should be present' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'amount should be present' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end

  it 'amount should be a valid decimal' do
    @entity.amount = 3.1
    expect(@entity).to be_valid
  end
end
