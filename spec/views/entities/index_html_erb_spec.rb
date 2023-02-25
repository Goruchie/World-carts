require 'rails_helper'

RSpec.describe 'Entities Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'test', email: 'tesfffft@example.com', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create(name: 'Amazon', user_id: @user.id)
    @entity = Entity.create(name: 'Entity 1', amount: 12, user_id: @user.id, group_id: @group.id)
    visit home_path
    click_on 'Log in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    visit group_entities_path(group_id: @group.id)
  end

  describe 'Welcome Page' do
    it 'displays the title of the app' do
      expect(page).to have_content('Purchases')
    end

    it 'displays the form of creating a new category' do
      click_on 'New purchase'
      expect(page).to have_content('Purchases')
      expect(page).to have_content('Log out')
    end

    it 'displays the form of creating a new category' do
      click_on 'New purchase'
      expect(page).to have_content('Back to purchases')
    end
  end
end
