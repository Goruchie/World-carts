require 'rails_helper'

RSpec.describe 'Groups Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'test', email: 'tesfffft@example.com', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Ebay', user_id: @user.id)
    visit home_path
    click_on 'Log in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    visit groups_path
  end

  describe 'Home Page' do
    it 'displays the title of the app' do
      expect(page).to have_content('World carts')
    end
    it 'displays the form of creating a new group' do
      click_on 'New cart'
      expect(page).to have_content('Add a store and it icon')
      expect(page).to have_content('Back to carts')
    end

    it 'displays the form of creating a new group' do
      click_on 'New cart'
      expect(page).to have_button('Add cart')
    end
  end
end
