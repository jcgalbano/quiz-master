# frozen_string_literal: true

require 'spec_helper'

feature 'Visitor logs in' do
  scenario 'with valid email and password' do
    user = FactoryBot.create(:user)
    visit user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path(root_path)
  end
  scenario 'with invalid email' do
    visit user_session_path
    fill_in 'Email', with: 'invalid'
    fill_in 'Password', with: 'sample_password123'
    click_button 'Log in'

    expect(page).to have_current_path(user_session_path)
  end
  scenario 'with invalid  password' do
    visit user_session_path
    fill_in 'Email', with: 'sample@example.com'
    fill_in 'Password', with: '1'
    click_button 'Log in'

    expect(page).to have_current_path(user_session_path)
  end
end
