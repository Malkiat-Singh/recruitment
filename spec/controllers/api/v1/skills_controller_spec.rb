require 'rails_helper'

RSpec.describe Api::V1::SkillsController, :type => :controller do


  let(:valid_attributes) {
    {
      name: "Иванов Иван Иванович"
    }
  }

  let(:invalid_attributes) {
    {
      name: nil
    }
  }

  describe "GET index" do
    it "assigns all skills as @skills" do
      skill = Skill.create! valid_attributes
      get :index, {}
      expect(assigns(:skills)).to eq([skill])
    end
  end

  describe "GET show" do
    it "assigns the requested skill as @skill" do
      skill = Skill.create! valid_attributes
      get :show, {:id => skill.to_param}
      expect(assigns(:skill)).to eq(skill)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Skill" do
        expect {
          post :create, {:skill => valid_attributes}
        }.to change(Skill, :count).by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved skill as @skill" do
        post :create, {:skill => invalid_attributes}
        expect(assigns(:skill)).to be_a_new(Skill)
      end

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          name: "Rails"
        }
      }

      it "updates the requested skill" do
        skill = Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :skill => new_attributes}
        skill.reload
        expect(assigns(:skill)).to eq(skill)
      end

    end

    describe "with invalid params" do
      it "assigns the skill as @skill" do
        skill = Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :skill => invalid_attributes}
        expect(assigns(:skill)).to eq(skill)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested skill" do
      skill = Skill.create! valid_attributes
      expect {
        delete :destroy, {:id => skill.to_param}
      }.to change(Skill, :count).by(-1)
    end
  end

end
