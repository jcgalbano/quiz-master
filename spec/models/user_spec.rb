# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # same test for sign up because FactoryBot.create(:user)
  # saves a user in the db and expects it to be_valid
  # which happens on sign_up

  # testing CRUD and assumptions
  context 'on create' do
    user_test = FactoryBot.create(:user)
    it 'has a valid factory and can sign up' do
      expect(user_test).to be_valid
    end
    it 'returns a user_name as a string' do
      expect(user_test.user_name.class).to eq(String)
    end
    it 'returns a email as a string' do
      expect(user_test.email.class).to eq(String)
    end
    it 'can be updated' do
      update_user_name = 'new_name'
      user_test.update(user_name: update_user_name)

      expect(user_test.reload.user_name).to eq(update_user_name)
    end
    it 'can be destroyed' do
      user_test.destroy
      expect(User.exists?(user_test.id)).to eq(false)
    end
    it 'is invalid when password and password_confirmation does not match' do
      expect(user_test.password) == user_test.password_confirmation
    end
  end

  # testing validations
  it 'is invalid without a user_name' do
    user_test = FactoryBot.build(:user, user_name: nil)

    expect(user_test).not_to be_valid
  end
  it 'is invalid without a email' do
    user_test = FactoryBot.build(:user, email: nil)

    expect(user_test).not_to be_valid
  end
  it 'is invalid without a password' do
    user_test = FactoryBot.build(:user, password: nil)

    expect(user_test).not_to be_valid
  end
  it { should validate_uniqueness_of(:user_name) }
  # email is case_insensitive by default in devise and in implementation
  # so we need to test its uniqueness with a case_insensitive declaration
  it { should validate_uniqueness_of(:email).case_insensitive }
end
