require 'rails_helper'

RSpec.describe Vacancy, :type => :model do

  context "has a valid factory" do 
    let(:vacancy) { create(:vacancy) }
    specify { vacancy.should be_valid }
  end

  context "is invalid without a name" do
    let(:vacancy) { build(:vacancy, name: nil) }
    specify { vacancy.should_not be_valid }
  end

  context "is invalid without a expire_at" do
    let(:vacancy) { build(:vacancy, expire_at: nil) }
    specify { vacancy.should_not be_valid }
  end

  context "is invalid without a salary" do
    let(:vacancy) { build(:vacancy, salary: nil) }
    specify { vacancy.should_not be_valid }
  end

  context "is invalid without a contacts" do
    let(:vacancy) { build(:vacancy, contacts: nil) }
    specify { vacancy.should_not be_valid }
  end  

end