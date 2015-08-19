require 'spec_helper'

RSpec.describe Spree::Admin::Compose::ContentsController, :type => :controller do

  stub_authorization!

  describe 'GET #index' do

    let(:content) { create(:content, slug: "/abc") }

    it 'renders the :index template' do
      spree_get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end

    it 'populates an array of contents' do
      spree_get :index
      expect(assigns(:contents)).to match_array([content])
    end

  end

  describe 'GET #new' do

    it "assigns a new Contact to @content" do
      spree_get :new
      expect(assigns(:content)).to be_a_new(Spree::Compose::Content) 
    end

    it 'renders the :new template' do
      spree_get :new
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end

  end

  describe 'GET#edit' do

    it "assigns the requested content to @content" do
      content = create(:content)
      get :edit, id: content
      expect(assigns(:content)).to eq content
    end
    
    it "renders the :edit template" do 
      content = create(:content)
      get :edit, id: content
      expect(response).to render_template :edit 
    end
  
  end

  describe 'POST#create' do

    context 'with valid attributes' do

      it "saves the new content in the database" do
        expect{
          spree_post :create, content: attributes_for(:content)
        }.to change(Spree::Compose::Content, :count).by(1)
      end

      it "redirects to content#index" do
        spree_post :create, content: attributes_for(:content)
        expect(response).to redirect_to admin_contents_path
      end

    end

  end

  describe 'PATCH#update' do

    context "valid attributes" do

      before :each do
        @content = create(:content, title: 'Dogs', slug: '/dogs')
      end

      it "locates the requested @content" do
        patch :update, id: @content, content: attributes_for(:content)
        expect(assigns(:content)).to eq(@content) 
      end

    end

  end

  describe 'DELETE#destroy' do 
    
    before :each do
      @content = create(:content) 
    end
    
    it "deletes the content" do 
      expect{
        spree_delete :destroy, id: @content
      }.to change(Spree::Compose::Content,:count).by(-1)
    end
    
    it "redirects to contents#index" do
      spree_delete :destroy, id: @content 
      expect(response).to redirect_to admin_contents_url
    end

  end

end