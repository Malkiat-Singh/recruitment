require 'rails_helper'

RSpec.describe Worker, :type => :model do

  context "has a valid factory" do 
    let(:worker) { create(:worker) }
    specify { worker.should be_valid }
  end

  context "is invalid without a name" do
    let(:worker) { build(:worker, name: nil) }
    specify { worker.should_not be_valid }
  end

  context "is invalid without full name" do
    let(:worker) { build(:worker, name: "Jhon") }
    specify { worker.should_not be_valid }
  end  

  context "is invalid with non russian name" do
    let(:worker) { build(:worker, name: "Jhon Jhon Jhon") }
    specify { worker.should_not be_valid }
  end  

  context "is invalid without contacts" do
    let(:worker) { build(:worker, contacts: nil) }
    specify { worker.should_not be_valid }
  end  

  context "is invalid without salary" do
    let(:worker) { build(:worker, salary: nil) }
    specify { worker.should_not be_valid }
  end    

  context "is invalid without status" do
    let(:worker) { build(:worker, status: nil) }
    specify { worker.should_not be_valid }
  end    

  context "is invalid without email or phone in contacts" do
    let(:worker) { build(:worker, contacts: "blablabla") }
    specify { worker.should_not be_valid }
  end  



end