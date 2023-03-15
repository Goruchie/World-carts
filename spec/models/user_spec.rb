require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', email: 'tom@yopmail.com', password: 'password') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'validates the email' do
    expect(subject.email).to match(/\A[\w+-.]+@[a-z\d-]+(.[a-z]+)*.[a-z]+\z/i)
  end
end
