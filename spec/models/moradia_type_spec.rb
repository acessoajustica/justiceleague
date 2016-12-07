require 'rails_helper'

RSpec.describe MoradiaType, type: :model do
  before :each do
    valid_attributes = FactoryGirl.attributes_for(:moradia_type)
    @moradia_type = MoradiaType.new valid_attributes
  end

  it "created_at is not nil" do
    @moradia_type.created_at = nil
    expect(@moradia_type).to_not be_valid
  end

  it "updated_at is not nil" do
    @moradia_type.updated_at = nil
    expect(@moradia_type).to_not be_valid
  end
end
