require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    subject {
      described_class.new(:name => "Chair", :price_cents => 20, :price => 30, :quantity => 2, :category => Category.new(:name => "neato"))
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    # it "is not valid without a price" do
    #   subject.price = nil
    #   expect(subject).to_not be_valid
    # end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end
end



