require "rails_helper"

RSpec.describe Address, type: :model do
  subject { create :address }

  it { is_expected.to be_valid }

  it { should validate_presence_of :name }

  it { should validate_presence_of :address }

  it { should validate_presence_of :phone }

  it { should validate_presence_of :city }

  it { should validate_presence_of :state }

  it { should have_many(:orders) }

  it { should belong_to(:user) }
end
