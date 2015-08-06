require 'rails_helper'

RSpec.describe Api::V1::VacanciesController, :type => :controller do


  let(:valid_attributes) {
    {
      name: "Vacancy Title",
      expire_at: 1.month.from_now,
      salary: 100000,
      contacts: "example@mail.com"
    }
  }

  let(:invalid_attributes) {
    {
      name: "Vacancy Title",
      expire_at: 1.month.from_now,
      salary: nil,
      contacts: "example@mail.com"
    }
  }

  describe "GET index" do
    it "assigns all vacancies as @vacancies" do
      vacancy = Vacancy.create! valid_attributes
      get :index, {}
      expect(assigns(:vacancies)).to eq([vacancy])
    end
  end

  describe "GET show" do
    it "assigns the requested vacancy as @vacancy" do
      vacancy = Vacancy.create! valid_attributes
      get :show, {:id => vacancy.to_param}
      expect(assigns(:vacancy)).to eq(vacancy)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vacancy" do
        expect {
          post :create, {:vacancy => valid_attributes}
        }.to change(Vacancy, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vacancy as @vacancy" do
        post :create, {:vacancy => invalid_attributes}
        expect(assigns(:vacancy)).to be_a_new(Vacancy)
      end

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          name: "Vacancy Title 2",
          expire_at: 2.month.from_now,
          salary: 200000,
          contacts: "example@mail.com"
        }
      }

      it "updates the requested vacancy" do
        vacancy = Vacancy.create! valid_attributes
        put :update, {:id => vacancy.to_param, :vacancy => new_attributes}
        vacancy.reload
        expect(assigns(:vacancy)).to eq(vacancy)
      end

    end

    describe "with invalid params" do
      it "assigns the vacancy as @vacancy" do
        vacancy = Vacancy.create! valid_attributes
        put :update, {:id => vacancy.to_param, :vacancy => invalid_attributes}
        expect(assigns(:vacancy)).to eq(vacancy)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vacancy" do
      vacancy = Vacancy.create! valid_attributes
      expect {
        delete :destroy, {:id => vacancy.to_param}
      }.to change(Vacancy, :count).by(-1)
    end
  end

end
