require 'rails_helper'

RSpec.describe Api::V1::WorkersController, :type => :controller do


  let(:valid_attributes) {
    {
      name: "Иванов Иван Иванович",
      contacts: "qwerty@mail.ru",
      salary: 100000,
      status: "active"
    }
  }

  let(:invalid_attributes) {
    {
      name: "Name",
      contacts: "blabla",
      salary: nil,
      status: nil
    }
  }

  describe "GET index" do
    it "assigns all workers as @workers" do
      worker = Worker.create! valid_attributes
      get :index, {}
      expect(assigns(:workers)).to eq([worker])
    end
  end

  describe "GET show" do
    it "assigns the requested worker as @worker" do
      worker = Worker.create! valid_attributes
      get :show, {:id => worker.to_param}
      expect(assigns(:worker)).to eq(worker)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Worker" do
        expect {
          post :create, {:worker => valid_attributes}
        }.to change(Worker, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved worker as @worker" do
        post :create, {:worker => invalid_attributes}
        expect(assigns(:worker)).to be_a_new(Worker)
      end

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          name: "Иванов Иван Васильевич",
          contacts: "qwerty@mail.ru",
          salary: 200000,
          status: "inactive"
        }
      }

      it "updates the requested worker" do
        worker = Worker.create! valid_attributes
        put :update, {:id => worker.to_param, :worker => new_attributes}
        worker.reload
        expect(assigns(:worker)).to eq(worker)
      end

    end

    describe "with invalid params" do
      it "assigns the worker as @worker" do
        worker = Worker.create! valid_attributes
        put :update, {:id => worker.to_param, :worker => invalid_attributes}
        expect(assigns(:worker)).to eq(worker)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested worker" do
      worker = Worker.create! valid_attributes
      expect {
        delete :destroy, {:id => worker.to_param}
      }.to change(Worker, :count).by(-1)
    end
  end

end
