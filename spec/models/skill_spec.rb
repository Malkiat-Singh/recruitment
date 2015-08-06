require 'rails_helper'

RSpec.describe Skill, :type => :model do

  context "has a valid factory" do 
    let(:skill) { create(:skill) }
    specify { skill.should be_valid }
  end

  context "is invalid without a name" do
    let(:skill) { build(:skill, name: nil) }
    specify { skill.should_not be_valid }    
  end

end
