require 'spec_helper'

RSpec.describe Spree::Admin::MenusController, type: :controller do

  stub_authorization!

  # This should return the minimal set of attributes required to create a valid
  # Spree::Compose::Menu. As you add validations to Spree::Compose::Menu, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "Menu X" }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET #index" do
    it "assigns all menus as @menus" do
      menu = create(:menu)
      spree_get :index, {}
      expect(assigns(:menus)).to eq([menu])
    end
  end

  describe "GET #show" do
    it "assigns the requested menu as @menu" do
      menu = create(:menu)
      spree_get :show, {:id => menu.to_param}
      expect(assigns(:menu)).to eq(menu)
    end
  end

  describe "GET #new" do
    it "assigns a new menu as @menu" do
      spree_get :new, {}
      expect(assigns(:menu)).to be_a_new(Spree::Compose::Menu)
    end
  end

  describe "GET #edit" do
    it "assigns the requested menu as @menu" do
      menu = create(:menu)
      spree_get :edit, {:id => menu.to_param}
      expect(assigns(:menu)).to eq(menu)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spree::Compose::Menu" do
        expect {
          spree_post :create, {:menu => valid_attributes}
        }.to change(Spree::Compose::Menu, :count).by(1)
      end

      it "assigns a newly created menu as @menu" do
        spree_post :create, {:menu => valid_attributes}
        expect(assigns(:menu)).to be_a(Spree::Compose::Menu)
        expect(assigns(:menu)).to be_persisted
      end

      it "redirects to the created menu" do
        spree_post :create, {:menu => valid_attributes}
        expect(response).to redirect_to(admin_menu_path(Spree::Compose::Menu.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved menu as @menu" do
        spree_post :create, {:menu => invalid_attributes}
        expect(assigns(:menu)).to be_a_new(Spree::Compose::Menu)
      end

      it "re-renders the 'new' template" do
        spree_post :create, {:menu => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested menu" do
        menu = create(:menu)
        spree_put :update, {:id => menu.to_param, :menu => new_attributes}
        menu.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested menu as @menu" do
        menu = create(:menu)
        spree_put :update, {:id => menu.to_param, :menu => valid_attributes}
        expect(assigns(:menu)).to eq(menu)
      end

      it "redirects to the menu" do
        menu = create(:menu)
        spree_put :update, {:id => menu.to_param, :menu => valid_attributes}
        expect(response).to redirect_to(admin_menu_url(menu))
      end
    end

    context "with invalid params" do
      it "assigns the menu as @menu" do
        menu = create(:menu)
        spree_put :update, {:id => menu.to_param, :menu => invalid_attributes}
        expect(assigns(:menu)).to eq(menu)
      end

      it "re-renders the 'edit' template" do
        menu = create(:menu)
        spree_put :update, {:id => menu.to_param, :menu => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested menu" do
      menu = create(:menu)
      expect {
        delete :destroy, {:id => menu.to_param}
      }.to change(Spree::Compose::Menu, :count).by(-1)
    end

    it "redirects to the menus list" do
      menu = create(:menu)
      delete :destroy, {:id => menu.to_param}
      expect(response).to redirect_to(admin_menus_url)
    end
  end

end
