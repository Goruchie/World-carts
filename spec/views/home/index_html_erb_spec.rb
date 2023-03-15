require 'rails_helper'
require 'json/ext'

RSpec.describe 'Welcome Page', type: :feature do
  before do
    visit home_path
  end
  describe 'Welcome Page' do
    it 'displays the title of the app' do
      expect(page).to have_content('World carts')
    end
    it 'displays the log in button' do
      expect(page).to have_content('Log in')
    end
    it 'displays the sign up button' do
      expect(page).to have_content('Sign up')
    end
  end
end
