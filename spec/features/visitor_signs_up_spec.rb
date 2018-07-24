# frozen_string_literal: true

require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid user_name, email, and password' do
    sign_up_with 'sample_user', 'valid@example.com', 'samplepass124'

    expect(page).to have_current_path(user_registration_path)
  end

  scenario 'with invalid email' do
    sign_up_with 'sample_user', 'invalid_email', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    sign_up_with 'sample_user', 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end

  def sign_up_with(user, email, password)
    visit new_user_registration_path
    fill_in 'User name', with: user
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end
end
