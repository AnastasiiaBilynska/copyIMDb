require "rails_helper"

RSpec.describe Admins::MoviesController, :type => :controller do
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
    it 'assigns the requested movie to @movie' do
      get :show, params: {id: @movie1 }
      expect(assigns(:movie)).to eq @movie1
    end
    it "renders the show template" do
      get :show, params: { id: @movie1 }
      expect(response).to render_template :show
    end
  end

  describe '#new' do
    it 'assigns a new movie' do
      get :new
      expect(assigns[:movie]).to be_a(Movie)
    end

    it 'renders the new movie template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    it 'renders the edit movie template' do
      get :edit, params: { id: @movie1 }
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    it 'movie successful updated' do
      @movie1.update(title: "Test")
      expect(Movie.find_by_title("Test")).to eq(@movie1)
    end
    it 'renders the edit movie template' do
      @movie1.update(title: "")
      expect(Movie.find_by_title("")).to be_nil
    end
  end

  describe '#create' do
    it 'created movie with valid params' do
      test = Movie.create(title: 'Test_new', text: 'Test_new_something', category_id: 1)
      expect(test).to be_valid
    end
    it 'created movie with invalid params' do
      test = Movie.create(title: 'T', text: 'Test', category_id: 1)
      expect(test).to be_invalid
    end
  end

  describe '#create' do
    it "renders delete" do
      delete :destroy, params: { id: @movie1 }
      expect(response).to redirect_to admins_movies_path
    end
  end
end
