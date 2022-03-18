require "rails_helper"

RSpec.describe MoviesController, :type => :controller do
  before(:all) do
    @category = create(:category)
    @movie1 = create(:movie)
  end

  describe "#index" do
    subject { get :index }
    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end
    it "renders the index template" do
      expect(subject).to render_template("index")
    end
  end

  describe "#show" do
    it "has a 200 status code" do
      get :show, params: { id: @movie1 }
      expect(response.status).to eq(200)
    end
    it "renders the show template" do
      get :show, params: { id: @movie1 }
      expect(response).to render_template :show
    end
  end
end
