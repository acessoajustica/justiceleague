require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ClientesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Cliente. As you add validations to Cliente, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:cliente)
  end

  let(:valid_attributes_with_atendimento) do
    FactoryGirl.attributes_for(:cliente, :cliente_with_atendimento)
  end

  let(:invalid_attributes) do
    FactoryGirl.attributes_for(:cliente, :cliente_invalid)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClientesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before (:each) do
    sign_in FactoryGirl.create(:user, :admin_user)
  end

  describe "GET #index" do
    it "assigns all clientes as @clientes" do
      cliente = Cliente.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:clientes)).to eq([cliente])
    end
  end

  describe "GET #show" do
    it "assigns the requested cliente as @cliente" do
      cliente = Cliente.create! valid_attributes
      get :show, {:id => cliente.to_param}, valid_session
      expect(assigns(:cliente)).to eq(cliente)
    end
  end

  describe "GET #new" do
    it "assigns a new cliente as @cliente" do
      get :new, {}, valid_session
      expect(assigns(:cliente)).to be_a_new(Cliente)
    end
  end

  describe "GET #edit" do
    it "assigns the requested cliente as @cliente" do
      cliente = Cliente.create! valid_attributes
      get :edit, {:id => cliente.to_param}, valid_session
      expect(assigns(:cliente)).to eq(cliente)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cliente" do
        expect {
          post :create, {:cliente => valid_attributes_with_atendimento}, valid_session
        }.to change(Cliente, :count).by(1)
      end

      it "assigns a newly created cliente as @cliente" do
        post :create, {:cliente => valid_attributes_with_atendimento}, valid_session
        expect(assigns(:cliente)).to be_a(Cliente)
        expect(assigns(:cliente)).to be_persisted
      end

      it "redirects to the created cliente" do
        post :create, {:cliente => valid_attributes_with_atendimento}, valid_session
        expect(response).to redirect_to(Cliente.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved cliente as @cliente" do
        post :create, {:cliente => invalid_attributes}, valid_session
        expect(assigns(:cliente)).to be_a_new(Cliente)
      end

      it "re-renders the 'new' template" do
        post :create, {:cliente => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:new_attributes) do
        FactoryGirl.attributes_for(:cliente, :another)
      end

      it "updates the requested cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, {:id => cliente.to_param, :cliente => new_attributes}, valid_session
        cliente.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested cliente as @cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, {:id => cliente.to_param, :cliente => valid_attributes}, valid_session
        expect(assigns(:cliente)).to eq(cliente)
      end

      it "redirects to the cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, {:id => cliente.to_param, :cliente => valid_attributes}, valid_session
        expect(response).to redirect_to(cliente)
      end
    end

    context "with invalid params" do
      it "assigns the cliente as @cliente" do
        cliente = Cliente.create! valid_attributes
        put :update, {:id => cliente.to_param, :cliente => invalid_attributes}, valid_session
        expect(assigns(:cliente)).to eq(cliente)
      end

      it "re-renders the 'edit' template" do
        cliente = Cliente.create! valid_attributes
        put :update, {:id => cliente.to_param, :cliente => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

end
