require "rails_helper"

RSpec.describe "Users Signin process", type: :feature do
  before(:all) do
    @user = create :regular_user
    @user.update(verified: true)
  end

  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  feature "when user enters correct inputs" do
    scenario "signs in user" do
      signin_helper(@user.email, "password")

      expect(page).to have_content "Get Started"
    end
  end

  feature "when inputs are incorrect" do
    scenario "does not sign user in" do
      signin_helper(@user.email, "wrong_password")

      expect(page).to have_no_content "SIGN OUT"
    end
  end
end
