require "rails_helper"
require 'support/factory_bot'
RSpec.describe Movie, :type => :model do

  before(:all) do
    @category = create(:category)
    @movie1 = create(:movie)
  end

  it "is valid with valid attributes" do
    expect(@movie1).to be_valid
  end

  it "has a unique title" do
    movie2 = build(:movie, title: @movie1.title)
    expect(movie2).to_not be_valid
  end

  it "is not valid without a title" do
    movie2 = build(:movie, title: nil)
    expect(movie2).to_not be_valid
  end

  it "is not valid with 1 char title" do
    movie2 = build(:movie, title: 'f' )
    expect(movie2).to_not be_valid
  end

  it "is not valid with 100 char title" do
    movie2 = build(:movie, title: Faker::Lorem.characters(number: 100))
    expect(movie2).to_not be_valid
  end

  it "is not valid without a text" do
    movie2 = build(:movie, text: nil)
    expect(movie2).to_not be_valid
  end

  it "is not valid a text " do
    movie2 = build(:movie, text: nil)
    expect(movie2).to_not be_valid
  end

  it "is not valid with 9 char text" do
    movie2 = build(:movie, text: Faker::Lorem.characters(number: 9) )
    expect(movie2).to_not be_valid
  end

  it "is not valid with 501 char text" do
    movie2 = build(:movie, text: Faker::Lorem.characters(number: 501))
    expect(movie2).to_not be_valid
  end

end
