require "rails_helper"
require 'support/factory_bot'
RSpec.describe Admin, :type => :model do

  before(:all) do
    @admin1 = build(:admin)
  end

  it "is valid with valid attributes" do
    admin2 = build(:admin, email: 'admin2@gmail.com', password: 'Admin@g2')
    expect(admin2).to be_valid
  end

  it "has a unique email" do
    admin2 = build(:admin, email: @admin1.email)
    expect(admin2).to_not be_valid
  end

  it "is not valid without a password" do
    admin2 = build(:admin, password: nil)
    expect(admin2).to_not be_valid
  end

  it "is not valid without an email" do
    admin2 = build(:admin, email: nil)
    expect(admin2).to_not be_valid
  end
end
